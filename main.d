import std.stdio;
import std.algorithm.comparison: among, equal;
import std.random;
import std.range: iota;

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
Checks if array a is full (the game is a tie)
Returns 1 if full, 0 if not full
 */
int check_tie(int[] a)
{
	for (int i = 0; i < 9; i++)
		if (a[i] == 0)
		   return 0;
	print_board(a);
	writeln("It's a tie!");
	return (1);
}

/*
Checks if the board has three X's in a row, or three O's in a row (win)
Returns 1 if there is a win condition, 0 if not
 */
int check_win(int[] a)
{
	int[][] b = [[0,1,2],
	    	     [3,4,5],
	    	     [6,7,8],
	    	     [0,3,6],
	    	     [1,4,7],
	    	     [2,5,8],
	    	     [0,4,8],
	    	     [2,4,6]];
	for (int i = 0; i < 8; i++)
	{
		if (a[b[i][0]] + a[b[i][1]] + a[b[i][2]] == 3)
		{
			print_board(a);
			writeln("X wins");
			return(1);
		}
		if (a[b[i][0]] + a[b[i][1]] + a[b[i][2]] == -3)
		{
			print_board(a);
			writeln("O wins");
			return(1);
		}
	}
	return (0);
}


int get_random()
{
    auto rnd = Random(unpredictableSeed);
    auto i = uniform(0, 8, rnd);
    return i;
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
		if (check_win(a))
			return;
		if (check_tie(a))
			return;
        int computer_idx;
        while (1)
        {
            computer_idx = get_random();
            if (a[computer_idx] is 0)
            {
                a[computer_idx] = -1;
                break;
            }
        }
		/* int i = 0;
		while (a[i] != 0)
		{
			i++;
		}
		a[i] = -1;
        */
		if (check_win(a))
			return;
		if (check_tie(a))
			return;
		break;
	}
    }
}
