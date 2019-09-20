import std.stdio;

void main(string[] args) {
     int[9] a = [ 0,0,0,1,0,-1,0,0,0 ];


     writeln(a[0], "|", a[1], "|", a[2]);
     writeln("-+-+-");
     writeln(a[3], "|", a[4], "|", a[5]);
     writeln("-+-+-");
     writeln(a[6], "|", a[7], "|", a[8]);
}
/*
Print function pseudocode

0. Loop, through array, and print with below logic
      If a[i] == 0, print i + 1
      Else if a[i] == 1, print X
      Else print O
*/