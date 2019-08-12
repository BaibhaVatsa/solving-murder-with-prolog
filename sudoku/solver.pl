% create constraints
% each row should be unique
% each column should be unique
% each 3x3 should be unique

print_sol([Head|Tail]) :-
    print(Head),
    print('\n'),
    print_sol(Tail).

valid_range([], _, _).
valid_range([Head|Tail], Start, End) :-
    Start =< End,
    Head >= Start,
    Head =< End,
    valid_range(Tail, Start, End).

all_distinct([]).
all_distinct([Head|Tail]) :-
    member(Head, Tail),
    all_distinct([Tail|Head]).

all_valid([]).
all_valid([Head|Tail]) :-
    all_distinct(Head),
    all_valid(Tail).

%carve(Solution, Type, N) :-

solve(Puzzle, Solution) :-
    length(Puzzle, L),
    N = floor(sqrt(L)),
    Solution = Puzzle,
    valid_range(Solution, 1, N),
    carve(Solution, Rows, N),
    carve(Solution, Cols, N),
    carve(Solution, Blocks, N),
    all_valid(Rows, N),
    all_valid(Cols, N),
    all_valid(Blocks, N),
    print_sol(Solution).
