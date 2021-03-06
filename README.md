# War

This is a demonstration project in which the computer plays the card game war with itself. 

## Playing War

The primary function is `play_war()` which plays one full game. The game is over when one of the player runs out of cards. In this implementation, if there is a war and a player does not hold 4 cards (to play three face down and then one face up), that player loses. Not everyone plays that way.

After each battle, the victor acquires the cards that were played; they are added to the bottom of the victor's pile in random order.

The output of `play_war()` is vector containing the number of cards held by the first player at each turn. That vector necessarily begins with the number 26 and ends with either 0 or 52. The length of the vector is one more than the number of battles to complete the game. In a normal battle, the difference between consecutive terms is ±1; after an ordinary war, the difference is ±5; after a double war, the difference is ±9, and so forth. 

### Variations

The function `play_war` divides a new, shuffled deck into two equal piles for the two players. It can also be invoked in one of the following alternative ways:

* `play_war(d::Vector{Card})` -- Here, `d` is a list of 52 distinct cards; that is, a full deck. The first 26 are given to the player #1 and the remaining cards to player #2.
* `play_war(d1::Vector{Card}, d2::Vector{Card})` -- Here, `d1` and `d2` are lists of cards that, taken together, constitute a full deck. The cards in `d1` form the pile for player #1 and the cards in `d2` are given to player #2. In this way one may start the game with the players receiving piles of different sizes. 

In either case, if the net input is not 52 distinct cards, a warning is issued but the function goes on, possibly giving nonsensical results. 


## Verbose Output

The function `verbose_war` may be used to control output during a game. With `verbose_war(true)` extensive output is produced:


```julia
julia> verbose_war(true)
true

julia> r = play_war();
[ 7♠ 6♢ 5♣ 3♠ 9♣ 5♡ 3♣ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ ]
[ 6♣ T♠ 8♡ J♡ A♠ 8♣ 9♡ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ ]

[ 6♢ 5♣ 3♠ 9♣ 5♡ 3♣ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ ]
[ T♠ 8♡ J♡ A♠ 8♣ 9♡ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ ]

[ 5♣ 3♠ 9♣ 5♡ 3♣ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ ]
[ 8♡ J♡ A♠ 8♣ 9♡ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ 6♢ T♠ ]

[ 3♠ 9♣ 5♡ 3♣ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ ]
[ J♡ A♠ 8♣ 9♡ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ 6♢ T♠ 8♡ 5♣ ]

[ 9♣ 5♡ 3♣ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ ]
[ A♠ 8♣ 9♡ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ 6♢ T♠ 8♡ 5♣ J♡ 3♠ ]

[ 5♡ 3♣ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ ]
[ 8♣ 9♡ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ 6♢ T♠ 8♡ 5♣ J♡ 3♠ 9♣ A♠ ]

[ 3♣ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ ]
[ 9♡ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ 6♢ T♠ 8♡ 5♣ J♡ 3♠ 9♣ A♠ 5♡ 8♣ ]

[ Q♠ Q♡ 6♡ T♣ K♡ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ ]
[ Q♣ T♢ 7♢ J♠ 9♢ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ 6♢ T♠ 8♡ 5♣ J♡ 3♠ 9♣ A♠ 5♡ 8♣ 9♡ 3♣ ]

It's war!

[ A♢ 2♢ 9♠ Q♢ A♣ 2♡ 8♠ A♡ J♢ 8♢ K♣ K♢ 3♢ 2♣ 6♣ 7♠ K♡ T♣ 9♢ T♢ 6♡ Q♡ J♠ Q♣ 7♢ Q♠ ]
[ J♣ 4♠ 7♣ 5♢ 4♢ 4♡ 3♡ K♠ T♡ 7♡ 4♣ 2♠ 6♠ 5♠ 6♢ T♠ 8♡ 5♣ J♡ 3♠ 9♣ A♠ 5♡ 8♣ 9♡ 3♣ ]
```
and so on.

Then
```
julia> length(r)
250
```
shows that this game had 249 battles. 

## Generating Statistics

We can use this module to play a lot of games. For example:
```julia
julia> t = [ length(play_war()) for k=1:10_000 ];

julia> maximum(t)
2315

julia> minimum(t)
12

julia> mean(t)
238.0841
```

The file `src/reporting.jl` contains code for generating statistics.

* `war_report(play_war())` gives information about a single play of war.
* `mean_report(reps)` gives information about multiple plays of war.


```julia
julia> mean_report(1_000_000)
Progress: 100%|█████████████████████████████████████████| Time: 0:02:27
Number of games played:           1000000
Average number of turns:          235.856447
Average number of single wars:    13.121822
Average number of double wars:    0.754379
Average number of triple wars:    0.041873
Average number of super wars:     0.00214
```

A "super war" is a quadruple or longer war. 