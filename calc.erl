-module(calc).
-export([main/0, calculate_hand/1, sum_cards/1, get_card_list/0, get_suit_list/0, is_consecutive/1, is_flush/1]).

% Main menu for hand selection
main() ->
    io:format("Welcome to the Balatro Calculator!~n"),
    io:format("Select a hand type:~n"),
    io:format("1 - High card, 2 - Pair, 3 - Two Pair, 4 - Three of a Kind, 5 - Straight,~n"),
    io:format("6 - Flush, 7 - Full House, 8 - Four of a Kind, 9 - Straight Flush~n"),
    
    {Answer, _} = string:to_integer(io:get_line("")),
    
    HandType = case Answer of
        1 -> high_card;
        2 -> pair;
        3 -> two_pair;
        4 -> three_of_a_kind;
        5 -> straight;
        6 -> flush;
        7 -> full_house;
        8 -> four_of_a_kind;
        9 -> straight_flush;
        _ -> invalid
    end,
    
    case HandType of
        invalid -> io:format("Invalid choice.~n");
        _ -> calculate_hand(HandType)
    end.

% Calculate chip gain for different hands
calculate_hand(high_card) ->
    io:format("Enter your card values separated by spaces: "),
    {ok, List} = get_card_list(),
    Total = sum_cards(List) * 1,
    io:format("Chip amount: ~p~n", [Total]);

calculate_hand(pair) ->
    io:format("Enter your card values separated by spaces: "),
    {ok, List} = get_card_list(),
    Total = (sum_cards(List) + 10) * 2,
    io:format("Chip amount: ~p~n", [Total]);

calculate_hand(two_pair) ->
    io:format("Enter your card values separated by spaces: "),
    {ok, List} = get_card_list(),
    Total = (sum_cards(List) + 20) * 3,
    io:format("Chip amount: ~p~n", [Total]);

calculate_hand(three_of_a_kind) ->
    io:format("Enter your card values separated by spaces: "),
    {ok, List} = get_card_list(),
    Total = (sum_cards(List) + 25) * 3,
    io:format("Chip amount: ~p~n", [Total]);

calculate_hand(straight) ->
    io:format("Enter 5 card values separated by spaces: "),
    {ok, List} = get_card_list(),
    
    case is_consecutive(List) of
        true ->
            Total = (sum_cards(List) + 30) * 4,
            io:format("Valid straight! Chip amount: ~p~n", [Total]);
        false ->
            io:format("Invalid straight! Numbers must be consecutive.~n")
    end;

calculate_hand(flush) ->
    io:format("Enter 5 card values separated by spaces: "),
    {ok, CardValues} = get_card_list(),

    io:format("Enter 5 suits separated by spaces (e.g., H H H H H for hearts): "),
    {ok, Suits} = get_suit_list(),

    case is_flush(Suits) of
        true ->
            Total = (sum_cards(CardValues) + 35) * 4,
            io:format("Valid flush! Chip amount: ~p~n", [Total]);
        false ->
            io:format("Invalid flush! All suits must be the same.~n")
    end;

calculate_hand(full_house) ->
    io:format("Enter your card values separated by spaces: "),
    {ok, List} = get_card_list(),
    Total = (sum_cards(List) + 50) * 5,
    io:format("Chip amount: ~p~n", [Total]);

calculate_hand(four_of_a_kind) ->
    io:format("Enter your card values separated by spaces: "),
    {ok, List} = get_card_list(),
    Total = (sum_cards(List) + 75) * 6,
    io:format("Chip amount: ~p~n", [Total]);

calculate_hand(straight_flush) ->
    io:format("Enter 5 card values separated by spaces: "),
    {ok, CardValues} = get_card_list(),

    io:format("Enter 5 suits separated by spaces: "),
    {ok, Suits} = get_suit_list(),

    case {is_consecutive(CardValues), is_flush(Suits)} of
        {true, true} ->
            Total = (sum_cards(CardValues) + 100) * 8,
            io:format("Valid straight flush! Chip amount: ~p~n", [Total]);
        {false, _} ->
            io:format("Invalid straight flush! Numbers must be consecutive.~n");
        {_, false} ->
            io:format("Invalid straight flush! All suits must be the same.~n")
    end.

% Recursive function to sum a list of card values
sum_cards([]) -> 0;
sum_cards([H | T]) -> H + sum_cards(T).

% Get a list of card values from user input
get_card_list() ->
    Line = io:get_line(""),
    try
        List = [list_to_integer(X) || X <- string:split(string:trim(Line), " ", all)],
        {ok, List}
    catch
        _:_ -> {error, "Invalid input"}
    end.

% Get a list of suits from user input
get_suit_list() ->
    Line = io:get_line(""),
    try
        List = string:split(string:trim(Line), " ", all),
        {ok, List}
    catch
        _:_ -> {error, "Invalid input"}
    end.

% Check if a list of card values forms a valid straight
is_consecutive(List) ->
    Sorted = lists:sort(List),
    is_consecutive_helper(Sorted).

is_consecutive_helper([_]) -> true;
is_consecutive_helper([A, B | T]) when B =:= A + 1 ->
    is_consecutive_helper([B | T]);
is_consecutive_helper(_) -> false.

% Check if all suits in a list are the same (valid flush)
is_flush([S]) -> true;  % Only one suit means all are the same
is_flush([S, S | T]) -> is_flush([S | T]);  % Recursively check suits
is_flush(_) -> false.
