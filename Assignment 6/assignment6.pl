/*Maximum from a List*/

max_list(X,Y,X) :- X >= Y.
 max_list(X,Y,Y) :- X < Y. 
max([X],X).
 max([X,Y|Z],Res) :-
   max([Y|Z],MRes),
   max_list(X,MRes,Res).

/*Sum of even Numbers from a List*/

sum_odd([],0).
sum_odd([X],0).
sum_odd([X,Y|Xs], Res) :-
sum_odd(Xs, Res1),
Res is Y + Res1.

/* Delete first k occurences */
delete_first_k(,,[],[]).
delete_first_k(_,0,M,M).
delete_first_k(A,K,[X|Xs],Res):- (A==X->K1 is K -1, delete_first_k(A,K1,Xs,Res) ; delete_first_k(A,K,Xs, Res1), Res = [X|Res1]).
