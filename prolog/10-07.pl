% Predicates (not functions)
square(Num, Result) :- Result is Num*Num.

% Factorial. Note the assignments and expressions
fact(0, 1).
fact(N, R) :- N>0, M is N-1, fact(M, Q), R is N*Q.

% Inefficient fibonacci using double recursion
fib(0, 0).
fib(1, 1).
fib(N, R) :- N>1, M is N-2, fib(M, Q), P is N-1, fib(P, S), R is Q+S.

% Efficient fibonacci using helper
fib2(N, R) :- help(N, 0, 1, R).
help(0, A, B, A).
help(N, A, B, R) :- N>0, M is N-1, T is A+B, help(M, B, T, R).

% Sum of lists using patterns
sum([], 0).
sum([H|T], R) :- sum(T, Q), R is H+Q.