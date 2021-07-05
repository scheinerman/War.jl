module War

using PlayingCards52, DataStructures

import Base: show

export Position

greet() = print("Hello World!")

Pile = Deque{Card}

function make_pile(clist::Vector{Card})::Pile
    result = Pile()
    for c in clist
        push!(result,c)
    end
    return result 
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
end

Position() = Position(deck())

function show(io::IO, P::Position)
    println(io,_string(P.A))
    println(io,_string(P.B))
end

end # module
