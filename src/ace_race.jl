#=
This is an experiment to see if one player starts out holding just four aces
and the other player has the rest of the deck, how do they fare?
=#

using PlayingCards52, War, ProgressMeter

function ace_race(reps::Int = 100_000)
    index_set = Set(2:13) ∪ Set(15:26) ∪ Set(28:39) ∪ Set(41:52)
    d1 = Card.([1,14,27,40])
    d2 = Card.(collect(index_set))

    a_wins = 0
    PM = Progress(reps)

    for k=1:reps 
        shuffle!(d2)
        r = play_war(d1,d2)[end]
        if r > 0
            a_wins += 1
        end
        next!(PM)
    end

    a_pct = 100a_wins / reps

    println("Four aces wins $a_pct% of the time")
end