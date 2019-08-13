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

carve(Solution, Return, N, Type) :-

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
