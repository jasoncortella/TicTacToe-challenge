# Hack day: TicTacToe challenge

                              | | (_)    | |           | |            
                              | |_ _  ___| |_ __ _  ___| |_ ___   ___ 
                              | __| |/ __| __/ _` |/ __| __/ _ \ / _ \
                              | |_| | (__| || (_| | (__| || (_) |  __/
                               \__|_|\___|\__\__,_|\___|\__\___/ \___|



## Description

* Tic-Tac-Toe is a computer generated game that can be played from the command line of your Virtual environment with two options available:

<ul>
<li>The two game player mode options are...</li>
<ul>
<li>Human(Player 1) Vs Human(Player 2)</li>
<li>Human Vs Machine</li>
</ul>
</ul>

* This game was coded in the D programming language. [Learn more](https://dlang.org/).

* To win the game, the player needs to be matching 3 consecutive positions, vertically, horizontally or diagonally

![Game Pattern (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Player_win.png)


## Installation and compilation of D-Programming Language in Linux-Ubuntu


* ```curl -fsS https://dlang.org/install.sh | bash -s dmd```

* To activate your Virtual Environment ```source ~/dlang/dmd-2.088.0/activate```

* To deactivate the environment - Type ```deactivate```

* To compile your program e.g main.d type ```dmd main.d```

* To run the program You need to type ```./main``` main being the executable file


## How to Play

* We assume that you have compiled the main file in your machine

* Run the command ```./main```

* Your Tic-Tac-Toe will now startup and you should be prompted to choose between 1 and 2 players:


![Welcome Page (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Welcome.png)


The Human (Player 1) Symbol is a letter "X" while the Machine or Player 2 Symbol is a letter "O".


![Game Symbols (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Symbols.png)     


When the Human (Player 1) selects a number, The Machine will select a Random whole number between 1 - 9, or it will be Player 2's turn:


![Game Selection Symbols (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Player_win.png) 
  

The Human and Machine (or Player 2) will continue playing until there is either a win or a tie.

A Win by the Machine:


![Machine Wins (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Machine_wins.png) 


A win by the Player 1:


![Player Wins (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Player_win.png)


A tie between Player 1 and Player 2:


![Tie between Machine Vs Player (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Tie.png)


Error message when you enter a non-empty position or an unknown character:


![Error Message (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Error_message.png)


Exiting the game can be done by entering "q" or "quit":

![Error Message (courtesy Team Big Ds ](https://github.com/jasoncortella/TicTacToe-challenge/blob/master/Images/Goodbye.png)



## Authors

Sneha Dasa Lakshminath - [sneha.dasasneha@gmail.com]

Jason Cortella - [jason.r.cortella@gmail.com]

George Solorio - [george_solorio@yahoo.com]

Laura Roudge - [laura.derohan@gmail.com]

Jun Zhu - [jzhu965601@gmail.com]

Koome Mwiti - [koome@neverest.co.ke]

