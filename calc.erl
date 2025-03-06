-module(calc).
-export([main/0, pair/0]).

main() ->
    io:format("Hello and welcome to the Balatro Calulator! The goal is simple, unsure what your score is based on your hand? No worries we got it covered!"),

    io:format("To begin, what hand are you trying to use? ()"),
    io:format("Options: 0 - High card, 1 - pair, 2 - two pair, 3 - three of a kind, 4 - straight, 5 - flush, 6 - full house, 7 - four of a kind, 8 - straight flush, 9 - royal flush, 10 - five of a kind, 11 - flush house, 12 - flush five"),

    Answer = io:get_line(""),

    if Answer =:= "1" ->
        pair()
    end.
    


pair() ->
    io:format("To start, what is the card you played? (Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    Card = io:get_line("").