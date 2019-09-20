	import std.stdio;
import std.algorithm;
import std.random;

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
 */
int check_tie(int[] a)
{
	int i = 0, flag = 0;

	while (i < 9)
	{
		if (a[i] != 0)
			flag = 1;
		else
			flag = 0;
		++i;
	}
	if (flag is 1)
	{
		print_board(a);
		writeln("It's a tie!");
		return (1);
	}
	return 0;
}

/*
Entry point
*/
void main(string[] args)
{
    int[9] a = [ 0,0,0,0,0,0,0,0,0 ];

    while (1)
    {
	print_board(a);
	string line;
	writeln("Enter a board position to make a move");
	while (1)
	{
		line = readln();
		if (line.length != 2)
		{
			 writeln("Input must be 1-9");
			 continue;
		}
		int intline = cast(int)line[0] - 48;
		if (intline < 1 || intline > 9)
		{
			 writeln("Input must be 1-9");
			 continue;
		}
		if (a[intline - 1] != 0)
		{
			 writeln("Must select empty tile");
			 continue;
		}
		writeln("You chose ", intline);
		a[intline - 1] = 1;
		if (check_tie(a))
			return;
		int i = 0;
		while (a[i] != 0)
		{
			i++;
		}
		a[i] = -1;
		if (check_tie(a))
			return;
		break;
	}
    }
}
