using ProgressMeter, War

"""
    war_result_vector(r::Vector{Int})::Vector{Int}

Return information about a game of war as a vector with the following components:
* [1] length of the game (number of battles)
* [2] number of single wars 
* [3] number of double wars 
* [4] number of triple wars 
* [5] number of quadruple (or longer) wars
"""
function war_result_vector(r::Vector{Int})::Vector{Int}
    result = zeros(Int, 5)
    dr = abs.(diff(r))
    result[1] = length(dr)

    result[2] = count(x -> 1 < x <= 5, dr)
    result[3] = count(x -> 5 < x <= 9, dr)
    result[4] = count(x -> 9 < x <= 13, dr)
    result[5] = count(x -> 14 < x, dr)

    return result
end


function war_report(r::Vector{Int})
    v = war_result_vector(r)
    println("Number of moves:          $(v[1])")
    println("Number of single wars:    $(v[2])")
    println("Number of double wars:    $(v[3])")
    println("Number of triple wars:    $(v[4])")
    println("Number of super wars:     $(v[5])")
end

"""
    mean_report(reps::Int = 100_000)

Play `reps` games of war and report statistics on the average 
number of battles, wars, double wars, and so on. 
"""
function mean_report(reps::Int = 100_000)
    v = zeros(Int, 5)
    PM = Progress(reps)
    for k = 1:reps
        v += war_result_vector(play_war())
        next!(PM)
    end
    v /= reps
    println("Number of games played:           $reps")
    println("Average number of turns:          $(v[1])")
    println("Average number of single wars:    $(v[2])")
    println("Average number of double wars:    $(v[3])")
    println("Average number of triple wars:    $(v[4])")
    println("Average number of super wars:     $(v[5])")
end
