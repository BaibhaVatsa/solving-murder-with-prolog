% create constraints
% each row should be unique
% each column should be unique
% each 3x3 should be unique

print_sol([Head|Tail]) :-
    write(Head),
    write(', '),
    print_sol(Tail).

valid_range([], _, _).
valid_range([Head|Tail], Start, End) :-
    Start =< End,
    Head >= Start,
    Head =< End,
    valid_range(Tail, Start, End).

not_in(_, []).
not_in(Val, [Head|Tail]) :-
    Val \= Head,
    not_in(Val, Tail).

all_distinct([]).
all_distinct([Head|Tail]) :-
    all_distinct(Tail),
    not_in(Head, Tail).

all_valid([]).
all_valid([Head|Tail]) :-
    all_distinct(Head),
    all_valid(Tail).

sublist_length([], _).
sublist_length([Head | Tail], Length) :- 
    length(Head, Length),
    sublist_length(Tail, Length).

nth0(I, List, Out) :- I1 is I + 1, nth(I1, List, Out).

insert_into_carved(Item, Values, X, Y) :-
    nth0(X, Values, Bucket),
    nth0(Y, Bucket, Item).

carve_position('row', Size, I, X, Y) :-   
    X is I // Size,
    Y is I mod Size.
carve_position('col', Size, I, X, Y) :- 
    X is I mod Size,
    Y is I // Size.
carve_position('square', Size, I, X, Y) :-
    Size_Sqrt is floor(sqrt(Size)),
    X is (I mod Size // Size_Sqrt) + (Size_Sqrt * (I // (Size * Size_Sqrt))),
    Y is (I mod Size_Sqrt) + (Size_Sqrt * ((I mod (Size * Size_Sqrt)) // Size)).

carve(Solution, Return, N, Type) :-
    carve(Solution, Return, N, Type, 0).
carve(_, Slice, Size, _, I) :-
    I is Size * Size,
    length(Slice, Size),
    sublist_length(Slice, Size).
carve([Head | Tail], Slice, Size, Type, I) :-
    carve_position(Type, Size, I, X, Y), 
    insert_into_carved(Head, Slice, X, Y),
    I1 is I + 1,
    carve(Tail, Slice, Size, Type, I1).


solve(Puzzle, Solution) :-
    length(Puzzle, L),
    N = floor(sqrt(L)),
    Solution = Puzzle,
    carve(Solution, Rows, N, 'rows'),
    carve(Solution, Cols, N. 'cols'),
    carve(Solution, Blocks, N, 'blocks'),
    all_valid(Rows, N),
    all_valid(Cols, N),
    all_valid(Blocks, N),
    valid_range(Solution, 1, N),
    print_sol(Solution).
