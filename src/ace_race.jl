#=
This is an experiment to see if one player starts out holding just four aces
and the other player has the rest of the deck, how do they fare?
=#

using PlayingCards52, War, ProgressMeter

function ace_race(reps::Int = 100_000)
    index_set = Set(2:13) ∪ Set(15:26) ∪ Set(28:39) ∪ Set(41:52)
    d1 = Card.([1, 14, 27, 40])
    d2 = Card.(collect(index_set))

    a_wins = 0
    a_steps = 0
    b_steps = 0
    PM = Progress(reps)

    for k = 1:reps
        shuffle!(d2)
        r = play_war(d1, d2)
        if r[end] > 0
            a_wins += 1
            a_steps += length(r) - 1
        else
            b_steps += length(r) - 1
        end
        next!(PM)
    end

    a_pct = 100a_wins / reps
    a_len = a_steps / reps
    b_len = b_steps / reps

    println("Four aces wins $a_pct% of the time")
    println("Average length of a winning game: $a_len")
    println("Average length of a losing game:  $b_len")

end
