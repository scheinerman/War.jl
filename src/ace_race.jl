#=
This is an experiment to see if one player starts out holding just four aces
and the other player has the rest of the deck, how do they fare?
=#

using PlayingCards52, War, ProgressMeter

"""
    ace_race(reps::Int = 10_000)

returns the frequency that four aces vs the rest of the deck wins at war.
Optionally, `ace_race(reps, skip_rank::Int)` to skip a different rank, e.g.,
`ace_race(skip_rank=13)` for kings.
"""
function ace_race(reps::Int = 10_000; skip_rank = 1)

    d = deck(false)
    d2 = [c for c in d if rank(c) != skip_rank]
    d1 = [Card(s, skip_rank) for s in PlayingCards52.suit_list]

    a_wins = 0
    PM = Progress(reps)

    for k = 1:reps
        shuffle!(d2)
        r = play_war(d1, d2)
        if r[end] > 0
            a_wins += 1
        end
        next!(PM)
    end

    a_pct = a_wins / reps
    return a_pct

    # a_len = a_steps / reps
    # b_len = b_steps / reps

    # println("Four aces wins $a_pct% of the time")
    # println("Average length of a winning game: $a_len")
    # println("Average length of a losing game:  $b_len")

end
