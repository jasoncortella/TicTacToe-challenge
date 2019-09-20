import std.stdio;
import std.algorithm;

/*
Returns what character to print depending
on the value in the result array at index idx
*/
char what(int[] a, int idx)
{
    if (a[idx] is 0) 
    {
        return (cast(char)(idx + 1 + 48));
    } else if (a[idx] is 1)
    {
        return ('X');
    } else if (a[idx] is -1)
    {
        return ('O');
    }
    assert(0);
}

/*
Prints the board with correct values
depending on the state of the game
*/
void print_board(int[] a)
{
    writeln(what(a, 0), "|", what(a, 1), "|", what(a, 2));
    writeln("-+-+-");
    writeln(what(a, 3), "|", what(a, 4), "|", what(a, 5));
    writeln("-+-+-");
    writeln(what(a, 6), "|", what(a, 7), "|", what(a, 8));
}

/*
Entry point
*/
void main(string[] args)
{
    int[9] a = [ 0,0,0,1,0,-1,0,0,0 ];

    print_board(a);
}
