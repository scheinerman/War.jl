# War

This is a demonstration project in which the computer plays the card game war with itself. 

The primary function is `play_war()` which plays one full game. A player loses when s/he runs out of cards. In this version, if there is a war, and a player does not hold 4 cards (to play three face down and then one face up), that player loses. Not everyone plays that way.

After each battle, the victor acquires the cards that were played; they are added to the bottom of the victor's pile in random order.

The output of `play_war()` is vector containing the number of cards held by the first player at each turn. That vector necessarily begins with the number 26 and ends with either 0 or 52. The length of the vector is the number of battles to complete the game. In a normal battle the difference between consecutive terms is ±1; after an ordinary war, the difference is ±5; after a double war, the difference is ±9, and so forth. 

## Verbose Output

The function `verbose_war` may be used to control output during a game. With `verbose_war(true)` extensive output is produced:


```julia
julia> verbose_war(true)
true

julia> play_war();
[ Q♢ K♣ K♠ 5♡ 2♢ 5♣ 5♢ 9♡ 9♠ 8♠ 8♣ 4♢ 9♢ 2♣ 3♢ T♡ 7♣ T♠ J♣ Q♣ A♣ 4♠ 4♡ 8♢ T♣ 7♠ 4♣ ]
[ T♢ 3♠ 6♣ 6♠ 2♡ K♡ J♢ 2♠ 6♢ A♠ 3♣ A♢ 7♡ 7♢ A♡ J♡ 5♠ K♢ 8♡ 3♡ Q♡ 9♣ J♠ Q♠ 6♡ ]

[ K♣ K♠ 5♡ 2♢ 5♣ 5♢ 9♡ 9♠ 8♠ 8♣ 4♢ 9♢ 2♣ 3♢ T♡ 7♣ T♠ J♣ Q♣ A♣ 4♠ 4♡ 8♢ T♣ 7♠ 4♣ Q♢ T♢ ]
[ 3♠ 6♣ 6♠ 2♡ K♡ J♢ 2♠ 6♢ A♠ 3♣ A♢ 7♡ 7♢ A♡ J♡ 5♠ K♢ 8♡ 3♡ Q♡ 9♣ J♠ Q♠ 6♡ ]

[ K♠ 5♡ 2♢ 5♣ 5♢ 9♡ 9♠ 8♠ 8♣ 4♢ 9♢ 2♣ 3♢ T♡ 7♣ T♠ J♣ Q♣ A♣ 4♠ 4♡ 8♢ T♣ 7♠ 4♣ Q♢ T♢ K♣ 3♠ ]
[ 6♣ 6♠ 2♡ K♡ J♢ 2♠ 6♢ A♠ 3♣ A♢ 7♡ 7♢ A♡ J♡ 5♠ K♢ 8♡ 3♡ Q♡ 9♣ J♠ Q♠ 6♡ ]

[ 5♡ 2♢ 5♣ 5♢ 9♡ 9♠ 8♠ 8♣ 4♢ 9♢ 2♣ 3♢ T♡ 7♣ T♠ J♣ Q♣ A♣ 4♠ 4♡ 8♢ T♣ 7♠ 4♣ Q♢ T♢ K♣ 3♠ K♠ 6♣ ]
[ 6♠ 2♡ K♡ J♢ 2♠ 6♢ A♠ 3♣ A♢ 7♡ 7♢ A♡ J♡ 5♠ K♢ 8♡ 3♡ Q♡ 9♣ J♠ Q♠ 6♡ ]

[ 2♢ 5♣ 5♢ 9♡ 9♠ 8♠ 8♣ 4♢ 9♢ 2♣ 3♢ T♡ 7♣ T♠ J♣ Q♣ A♣ 4♠ 4♡ 8♢ T♣ 7♠ 4♣ Q♢ T♢ K♣ 3♠ K♠ 6♣ ]
[ 2♡ K♡ J♢ 2♠ 6♢ A♠ 3♣ A♢ 7♡ 7♢ A♡ J♡ 5♠ K♢ 8♡ 3♡ Q♡ 9♣ J♠ Q♠ 6♡ 5♡ 6♠ ]

It's WAR!
[ 8♠ 8♣ 4♢ 9♢ 2♣ 3♢ T♡ 7♣ T♠ J♣ Q♣ A♣ 4♠ 4♡ 8♢ T♣ 7♠ 4♣ Q♢ T♢ K♣ 3♠ K♠ 6♣ 5♣ 5♢ 2♡ K♡ 2♠ J♢ 6♢ 2♢ 9♠ 9♡ ]
[ A♠ 3♣ A♢ 7♡ 7♢ A♡ J♡ 5♠ K♢ 8♡ 3♡ Q♡ 9♣ J♠ Q♠ 6♡ 5♡ 6♠ ]
```
and so on until
```julia
[ 3♣ T♠ 8♢ 9♡ 2♢ ]
[ 3♡ 7♣ K♣ 3♠ Q♣ Q♠ 4♣ T♡ 8♡ A♢ K♠ 9♢ T♣ 4♡ J♡ 6♣ 5♡ 6♠ 4♠ 9♠ J♣ 5♢ 6♡ J♠ A♠ 5♣ 7♠ Q♡ 7♡ A♡ 2♣ J♢ 2♠ A♣ 4♢ K♢ Q♢ T♢ 2♡ 5♠ K♡ 8♠ 3♢ 8♣ 7♢ 9♣ 6♢ ]

It's WAR!
[ ]
[ Q♠ 4♣ T♡ 8♡ A♢ K♠ 9♢ T♣ 4♡ J♡ 6♣ 5♡ 6♠ 4♠ 9♠ J♣ 5♢ 6♡ J♠ A♠ 5♣ 7♠ Q♡ 7♡ A♡ 2♣ J♢ 2♠ A♣ 4♢ K♢ Q♢ T♢ 2♡ 5♠ K♡ 8♠ 3♢ 8♣ 7♢ 9♣ 6♢ 3♠ 8♢ 3♡ Q♣ 9♡ 7♣ 3♣ 2♢ T♠ K♣ ]
```
In this game, player #1 has lost. 