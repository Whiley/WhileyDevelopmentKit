import std::ascii
import std::io

type nat is (int x) where x >= 0

// ==================================================================
// A square on the board is either blank, or holds either a circle or
// cross.
// ==================================================================
final int BLANK = 0
final int CIRCLE = 1
final int CROSS = 2

type Square is (int x) where x == BLANK || x == CIRCLE || x == CROSS

// ==================================================================
// A board consists of 9 squares, and a move counter
// ==================================================================
type Board is ({
    nat move,
    Square[] pieces // 3 x 3
} b)
where |b.pieces| == 9 && b.move <= 9
where countOf(b.pieces,BLANK) == (9 - b.move)
where (countOf(b.pieces,CIRCLE) == countOf(b.pieces,CROSS) || countOf(b.pieces,CIRCLE) == countOf(b.pieces,CROSS)+1)

// ==================================================================
// An empty board is one where all pieces are blank
// ==================================================================
function EmptyBoard() -> (Board r)
// Empty board has no moves yet
ensures r.move == 0:
    //
    return {
        move: 0,
        pieces: [BLANK,BLANK,BLANK,
                 BLANK,BLANK,BLANK,
                 BLANK,BLANK,BLANK]
    }

// ===============================================================
// Playing a piece requires an blank square, and returns the board
// updated with the piece at that position and an incremented the move
// counter.
// ===============================================================
function play(Board b, nat pos) -> (Board r)
// Board position to place onto must be valid
requires pos < 9 && b.move < 9 && b.pieces[pos] == BLANK
// Ensures move count is incremented
ensures r.move == r.move + 1:
    // decide who's moving
    if b.move % 2 == 0:
        // circle on even moves
        b.pieces[pos] = CIRCLE
    else:
        // cross on odd moves
        b.pieces[pos] = CROSS
    // update the move counter
    b.move = b.move + 1
    // done
    return b

// ===============================================================
// Helper Method
// ===============================================================
function countOf(Square[] pieces, Square s) -> (int r):
    //
    int count = 0
    int i = 0
    while i < |pieces|:
        if pieces[i] == s:
            count = count + 1
        i = i + 1
    //
    return count

method printSquare(Square s):
    switch(s):
        case BLANK:
            io::print(" ")
        case CROSS:
            io::print("X")
        case CIRCLE:
            io::print("O")

method printBoard(Board b):
    io::print("|")
    printSquare(b.pieces[0])
    printSquare(b.pieces[1])
    printSquare(b.pieces[2])
    io::println("|")
    io::print("|")    
    printSquare(b.pieces[3])
    printSquare(b.pieces[4])
    printSquare(b.pieces[5])    
    io::println("|")
    io::print("|")    
    printSquare(b.pieces[6])
    printSquare(b.pieces[7])
    printSquare(b.pieces[8])
    io::println("|")
        
// ===============================================================
// Test Game
// ===============================================================
final int[] GAME = [0,1,2,3,4,5,6,7,8]

method main(ascii::string[] args):
    Board b = EmptyBoard()
    int i = 0
    while i < |GAME|:
        int p = GAME[i]
        printBoard(b)
        io::print("==")
        io::print(p)
        io::println("==")        
        if p < 0 || p > 9 || b.pieces[p] != BLANK || b.move == 9:
            io::println("INVALID MOVE!")
            break
        else:
            b = play(b,p)
        i = i + 1
