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
    // writeln("\n");
    writeln("-------");
    writeln("|", what(a, 0), "|", what(a, 1), "|", what(a, 2), "|");
    writeln("--+-+--");
    writeln("|", what(a, 3), "|", what(a, 4), "|", what(a, 5), "|");
    writeln("--+-+--");
    writeln("|", what(a, 6), "|", what(a, 7), "|", what(a, 8), "|");
    writeln("-------");
    // writeln("\n");
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
	writeln("\nThe board is full, the game is a tie!\n");
	return (1);
}

/*
Checks if the board has three X's in a row, or three O's in a row (win)
Returns 1 if there is a win condition, 0 if not
 */
int check_win(int[] a, int p2)
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
			writeln("\nCongratulations player X, you win!\n");
			return(1);
		}
		if (a[b[i][0]] + a[b[i][1]] + a[b[i][2]] == -3 && p2 == 0)
		{
			print_board(a);
			writeln("\nAwwww, better luck next time :(\n");
			return(1);
		}
		if (a[b[i][0]] + a[b[i][1]] + a[b[i][2]] == -3 && p2 == 1)
		{
			print_board(a);
            writeln("\nCongratulations player O, you win!\n");
            return(1);
		}
	}
	return (0);
}

/*
Returns a random position for the computer to place its ‘O’
*/
int get_random()
{
    auto rnd = Random(unpredictableSeed);
    auto i = uniform(0, 8, rnd);
    return i;
}

/*
Prompts for single player mode, will be competing againts randomized computer positions
*/
int player1(int[] a)
{
	while (1)
	{
	    print_board(a);
        string line;
        writeln("\nPlayer X turn. Enter a board position 1-9 to make your move:");
		line = readln();
		if (line == "q\n" || line == "quit\n")
		{
		    writeln("\nGoodbye! :(\n");
		    return 1;
		}
		if (line.length != 2)
		{
			 writeln("Invalid input. Input must be 1-9.");
			 continue;
		}
		int intline = cast(int)line[0] - 48;
		if (intline < 1 || intline > 9)
		{
			 writeln("Invalid input. Input must be 1-9.");
			 continue;
		}
		if (a[intline - 1] != 0)
		{
			 writeln("Invalid input. Must select an empty tile.");
			 continue;
		}
		writeln("You chose ", intline);
		a[intline - 1] = 1;
		if (check_win(a, 0))
			return 1;
		if (check_tie(a))
			return 1;
        int computer_idx;
        while (1)
      	{
		    computer_idx = get_random();
            if (a[computer_idx] is 0)
            {
                a[computer_idx] = -1;
		writeln("Computer chose ", computer_idx + 1);
                break;
            }
        }
	if (check_win(a, 0))
	    return 1;
	if (check_tie(a))
	    return 1;
	}
    return 1;
}

/*
Prompt 2 player mode if 2 is inputed that allows 2 players to play against each other.
*/
int player2(int[] a)
{
	int p2 = 1;

	while (1)
	{
	    print_board(a);
        string line;
		if (p2 == 1)
            writeln("\nPlayer X turn. Enter a board position 1-9 to make your move:");
		else
			writeln("\nPlayer O turn. Enter a board position 1-9 to make your move:");
		line = readln();
		if (line == "q\n" || line == "quit\n")
		{
		    writeln("\nGoodbye! :(\n");
		    return 1;
		}
		if (line.length != 2)
		{
			 writeln("Invalid input. Input must be 1-9.");
			 continue;
		}
		int intline = cast(int)line[0] - 48;
		if (intline < 1 || intline > 9)
		{
			 writeln("Invalid input. Input must be 1-9.");
			 continue;
		}
		if (a[intline - 1] != 0)
		{
			 writeln("Invalid input. Must select empty tile.");
			 continue;
		}
		writeln("You chose ", intline);
		if (p2 == 1)
			a[intline - 1] = 1;
		else
			a[intline - 1] = -1;
		if (check_win(a, 1))
			return 1;
		if (check_tie(a))
			return 1;
		if (p2 == 1)
			p2 = 2;
		else
			p2 = 1;
	}
    return 1;
}

/*
Entry point
*/
void main(string[] args)
{
    int[9] a = [ 0,0,0,0,0,0,0,0,0 ];
    string line;

    writeln("\nWelcome to tic tac toe!\n");
    while (1)
    {
        writeln("Choose how many players will be playing.");
        write("Enter either 1 or 2: ");
        line = readln();
        if (line == "1\n")
        {
             if (player1(a) == 1)
                 break;
        }
        else if (line == "2\n")
        {
            if (player2(a) == 1)
            break;
        }
	else
	{
	    writeln("************************");
	    writeln("Please enter valid input");
	    writeln("************************");
	}
    }
}
