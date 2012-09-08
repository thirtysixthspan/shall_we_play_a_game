Wouldn't you prefer a good game of chess?
---

## The Game of Chess
First we'll need to review the [Rule of Chess](http://en.wikipedia.org/wiki/Rules_of_chess).

## Our choice of notation
We'll use [Descriptive Notation](http://en.wikipedia.org/wiki/Descriptive_chess_notation)
for fun and because they use it in the chess game between HAL and Poole in 2001: A Space Odyssey. 
Descriptive Notation is an obsolete notation that uses a relative rather than absolute coordinate system 
whereby a position on the board is given by its rank, ranging from 1 to 8 starting on the moving player's 
side of the board, and its file, given by the name of the piece that occupies rank 1 at the start of the game.

## The cast of characters
King (K), Queen (Q), Rook (R), Bishop (B), Knight (N), and Pawn (P)

## The dance card
Every piece has a different set of moves that it can make. For example, Bishops can only move along the diagonals while the Queen can move move along the cardinals and the diagonals. We can represent these basic moves as a set of delta (rank, file) vectors. For example, the King can move one space in any direction and thus his dance card looks like this:
<pre>
(1,0), (1,1), (0,1), (-1,1), (-1,0), (-1,-1), (0,-1), (1,-1)
</pre>

The Bishop can move along any diagonal up to 7 spaces so his dance card looks like this:
<pre>
( 1, 1), ( 2, 2) ..... ( 7, 7),
(-1, 1), (-2, 2) ..... (-7, 7),
( 1,-1), ( 2,-2) ..... ( 7,-7),
(-1,-1), (-2,-2) ..... (-7,-7) 
</pre>
Similarly, the Rook moves only along the cardinals and the Queen moves along the cardinals and diagonals. 

The Knight can move along a L shaped path starting in any cardinal direction giving the following dance card:
<pre>
(+1,+2), (+2,+1),
(-1,+2), (-2,+1),
(+1,-2), (+2,-1),
(-1,-2), (-2,-1)
</pre>

The Pawn can move move forward up to two spaces if those space are unoccupied and can move diagonally
forward if those spots are occupied by an opponet's piece. To represent this dependancy upon occupancy,
we add a third value to the vector where:
* 1 requires the landing space be empty
* 2 requires the landing space be occupied by an opposing piece
* 3 requires the space to either be empty or occupied by an opposing piece

resulting in the following dance card:
<pre>
(+1, 0, 1), (+2, 0, 1),
(+1,+1, 2), (+1,-1, 2)
</pre>

For all other pieces, the occupancy value is 3 and is omitted herein for convenience.

## This dance contest has rules

All pieces may move to any position allowed by the dance card if and only if
* it is within the extent of the board
* no other piece blocks the path, unless the piece in motion is a Knight
* movement away from the piece's current position on the board does not place the King in check






