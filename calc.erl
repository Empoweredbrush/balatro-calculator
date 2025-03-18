-module(calc).
-export([main/0, high_card/0, pair/0, two_pair/0, three_of_a_kind/0, straight/0, flush/0, full_house/0, four_of_a_kind/0, straight_flush/0]).

main() ->
    io:format("Hello and welcome to the Balatro Calulator! ~nThe goal is simple, unsure what your score is based on your hand? No worries we got it covered!"),

    io:format("To begin, what hand are you trying to use?~n"),
    io:format("Options: ~n1 - High card, ~n2 - pair, ~n3 - two pair, ~n4 - three of a kind, ~n5 - straight, ~n6 - flush, ~n7 - full house, ~n8 - four of a kind, ~n9 - straight flush, ~n10 - royal flush~n"),

    {Answer, _} = string:to_integer(io:get_line("")),

    case Answer of
      1 -> high_card();
      2 -> pair();
      3 -> two_pair();
      4 -> three_of_a_kind();
      5 -> straight();
      6 -> flush();
      7 -> full_house();
      8 -> four_of_a_kind();
      9 -> straight_flush()
    end.
    

high_card() ->
    io:format("To start your high card calculation, what is the card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card, _} = string:to_integer(io:get_line("")),

    High_Chips = 5,

    High_mult = 1,

    Add_Total = Card + High_Chips,

    Total = Add_Total * High_mult,
    
    io:format("Chips amount: ~p~n", [Total]).


pair() ->
    io:format("To start you pair calculation, what is the card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card, _} = string:to_integer(io:get_line("")),

    Pair_Chips = 10,

    Pair_Mult = 2,

    Add_Total = Card + Card + Pair_Chips,

    Total = Add_Total  * Pair_Mult,

    io:format("Chip amount: ~p", [Total]).

two_pair() ->
    io:format("To start you two pair calculation, what is the first pair in the hand? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)~n"),

    {First_Card, _} = string:to_integer(io:get_line("")),

    io:format("What is the second pair?~n"),

    {Second_Card, _} = string:to_integer(io:get_line("")),

    Two_Pair_Chips = 20,

    Two_Pair_Mult = 2,

    Total = ((First_Card * 2) + (Second_Card * 2) + Two_Pair_Chips) * Two_Pair_Mult,

    io:format("Chip amount: ~p", [Total]).

three_of_a_kind() ->
    io:format("To start your three of a kind calculation, what is the card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card, _} = string:to_integer(io:get_line("")),

    Three_Kind_Chips = 30,

    Three_Kind_Mult = 3,

    Total = (((Card * 3) + Three_Kind_Chips) * Three_Kind_Mult),

    io:format("Chip amount: ~p", [Total]).

straight() ->
    io:format("To start your straight hand calculation, what is the first card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_1, _} = string:to_integer(io:get_line("")),

    io:format("What is the second card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_2, _} = string:to_integer(io:get_line("")),

    io:format("What is the third card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_3, _} = string:to_integer(io:get_line("")),

    io:format("What is the fourth card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_4, _} = string:to_integer(io:get_line("")),

    io:format("What is the fifth card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_5, _} = string:to_integer(io:get_line("")),

    Straight_Chips = 30,

    Straight_Mult = 4,

    Total = ((Card_1 + Card_2 + Card_3 + Card_4 + Card_5 + Straight_Chips) * Straight_Mult),

    io:format("Chip amount: ~p", [Total]).

flush() ->
    io:format("To start your flush hand calculation, what is the first card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_1, _} = string:to_integer(io:get_line("")),

    io:format("What is the second card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_2, _} = string:to_integer(io:get_line("")),

    io:format("What is the third card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_3, _} = string:to_integer(io:get_line("")),

    io:format("What is the fourth card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_4, _} = string:to_integer(io:get_line("")),

    io:format("What is the fifth card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_5, _} = string:to_integer(io:get_line("")),

    Flush_Chips = 35,

    Flush_Mult = 4,

    Total = ((Card_1 + Card_2 + Card_3 + Card_4 + Card_5 + Flush_Chips) * Flush_Mult),

    io:format("Chip amount: ~p", [Total]).

full_house() ->
    io:format("To start you full house pair calculation, what is the three of a kind in the hand? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)~n"),

    {First_Card, _} = string:to_integer(io:get_line("")),

    io:format("What is the pair?~n"),

    {Second_Card, _} = string:to_integer(io:get_line("")),

    Full_House_Chips = 40,

    Full_House_Mult = 4,

    Total = ((First_Card * 3) + (Second_Card * 2) + Full_House_Chips) * Full_House_Mult,

    io:format("Chip amount: ~p", [Total]).

four_of_a_kind() ->
    io:format("To start your four of a kind calculation, what is the card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card, _} = string:to_integer(io:get_line("")),

    Four_Kind_Chips = 60,

    Four_Kind_Mult = 7,

    Total = (((Card * 4) + Four_Kind_Chips) * Four_Kind_Mult),

    io:format("Chip amount: ~p", [Total]).

straight_flush() ->
    io:format("To start your straight flush hand calculation, what is the first card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_1, _} = string:to_integer(io:get_line("")),

    io:format("What is the second card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_2, _} = string:to_integer(io:get_line("")),

    io:format("What is the third card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_3, _} = string:to_integer(io:get_line("")),

    io:format("What is the fourth card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_4, _} = string:to_integer(io:get_line("")),

    io:format("What is the fifth card you played? ~n(Note: use numbers for answers: Ace = 14, King = 13, Queen = 12, Jack = 11)"),

    {Card_5, _} = string:to_integer(io:get_line("")),

    Straight_Flush_Chips = 100,

    Straight_Flush_Mult = 8,

    Total = ((Card_1 + Card_2 + Card_3 + Card_4 + Card_5 + Straight_Flush_Chips) * Straight_Flush_Mult),

    io:format("Chip amount: ~p", [Total]).

