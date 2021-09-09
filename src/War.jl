module War

using DataStructures: isempty, collect, popfirst!
using PlayingCards52, DataStructures

import Base: show

export Position, battle, play_war, verbose_war

ace_high()


Pile = Deque{Card}


"""
    make_pile(clist::Vector(Card))

Make a `Pile` from a list of cards. 
"""
function make_pile(clist::Vector{Card})::Pile
    result = Pile()
    add_to_pile(result, clist)
    return result
end

"""
    add_to_pile(pile::Pile, clist::Vector{Card})

Add the cards in `clist` to the bottom of `pile`.
"""
function add_to_pile(pile::Pile, clist::Vector{Card})
    for c in clist
        push!(pile, c)
    end
end

function _string(pile::Pile)::String
    result = "[ "
    for c in pile
        result *= "$c "
    end
    result *= "]"
    return result
end

struct Position
    A::Pile
    B::Pile
    function Position(d::Vector{Card})
        new(make_pile(d[1:26]), make_pile(d[27:52]))
    end
    function Position(P1::Pile, P2::Pile)
        new(P1, P2)
    end
end

Position() = Position(deck())

function Position(d1::Vector{Card}, d2::Vector{Card})
    nd = length(d1) + length(d2)
    S = Set{Card}(d1) ∪ Set{Card}(d2)
    ns = length(S)
    if nd != 52 || ns != 52
        @warn "Improper deck: the there are $nd cards in the two piles and $ns cards in their union. Carrying on anyhow."
    end
    A = make_pile(d1)
    B = make_pile(d2)
    Position(A, B)
end


function show(io::IO, P::Position)
    println(io, _string(P.A))
    println(io, _string(P.B))
end

const A_win = -1
const B_win = 1
const Tie = 0

VERBOSE = false


"""
    verbose_war
Use `verbose_war(true)` to have detailed reporting during a game of war and `verbose_war(false)` to supress that. 
"""
function verbose_war(tf::Bool = true)
    global VERBOSE = tf
end



"""
    battle_compare(a::Card, b::Card)::Int 

Compare two cards by War rules. Returns:
* `A_win` if `a` beats `b`.
* `B_win` if `b` beats `a`.
* `Tie` if `a` and `b` have the same rank.
"""
function battle_compare(a::Card, b::Card)::Int
    if rank(a) == rank(b)
        return Tie
    end
    return a > b ? A_win : B_win
end


function give_spoils(P::Position, used::Set{Card}, winner::Int)
    spoils = shuffle(collect(used))
    if winner == A_win
        add_to_pile(P.A, spoils)
    end
    if winner == B_win
        add_to_pile(P.B, spoils)
    end
    nothing
end


"""
    battle(P::Position, used::Set{Card})

execute one turn in War.
"""
function battle(P::Position, used::Set{Card} = Set{Card}())

    # if a player is out of cards, the spoils go the other player (who then wins)
    if isempty(P.A) || isempty(P.B)
        result = isempty(P.A) ? B_win : A_win
        give_spoils(P, used, result)
        return
    end

    # get the first card from each player and compare
    a = popfirst!(P.A)
    b = popfirst!(P.B)
    push!(used, a)
    push!(used, b)

    result = battle_compare(a, b)
    if result != Tie
        give_spoils(P, used, result)
        return
    end

    if VERBOSE
        println("It's war!\n")
    end

    # need at least 4 cards or the game is lost

    if length(P.A) < 4      # A loses
        while !isempty(P.A)
            c = popfirst!(P.A)
            push!(used, c)
        end
        give_spoils(P, used, B_win)
        return
    end

    if length(P.B) < 4      # B loses
        while !isempty(P.B)
            c = popfirst!(P.B)
            push!(used, c)
        end
        give_spoils(P, used, A_win)
        return
    end

    # both have enough cards 
    for k = 1:3
        c = popfirst!(P.A)
        push!(used, c)
        c = popfirst!(P.B)
        push!(used, c)
    end
    battle(P, used)
end


function play_war(P::Position)
    result = [length(P.A)]
    if VERBOSE
        println(P)
    end
    while length(P.A) > 0 && length(P.B) > 0
        battle(P)
        if VERBOSE
            println(P)
        end
        push!(result, length(P.A))
    end
    return result
end

function play_war(d1::Vector{Card}, d2::Vector{Card})
    P = Position(d1, d2)
    play_war(P)
end

function play_war(d::Vector{Card})
    P = Position(d)
    play_war(P)
end

"""
    play_war
Play a game of War. Options:
+ `play_war()`: Play a new game of war with random deck of cards.
+ `play_war(d::Vector{Card})`: Play war with a given deck of cards.
+ `play_war(d1::Vector{Card},d2::Vector{Card})`: Play war in which player 1 gets the cards in `d1` and player 2 gets the cards in `d2`.

The output of `play_war` is vector containing the number of cards held by the first player at each turn. That vector necessarily begins with the number 26 and ends with either 0 or 52. The length of the vector is one more than the number of battles to complete the game. In a normal battle, the difference between consecutive terms is ±1; after an ordinary war, the difference is ±5; after a double war, the difference is ±9, and so forth.

See: `verbose_war`.
"""
play_war() = play_war(deck())

end  #end of module War
