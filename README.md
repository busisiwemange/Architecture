# Architecture

This project is about assembly language programming using the MIPS simulator called SPIM.

Question 1

Write a program (question1.asm) to enter a series of 5 arbitrary strings and then print them out.  Store the strings in memory.

Sample IO:

Enter a series of 5 formulae:

1

2

3

=1

=2

The values are:

1

2

3

=1

=2

Question 2

Write a program (question2.asm) to convert a string into an integer. 

Assume that your input string is prefixed with an arbitrary non-numeric character that must be ignored and that all subsequent characters are numerals.  Add 5 to the input value and print out the sum.

Sample IO:

Enter a string:
X123

The value +5 is:
128

Question 3

Using the previous 2 questions, write a program (question3.asm) to compute a simple 1-dimensional spreadsheet containing integers and integer formulae.  First, input the spreadsheet source values from the console, then perform calculations as outlined below and finally output the computed spreadsheet.

A cell may contain either an integer value or a formula that is a reference to another cell.  Cells are numbered 0-4 from top to bottom and a reference is indicated by a "=" prefix followed by the cell number (e.g., =2).  A reference can only be made to a previous cell, and the cell referred to may itself contain a formula.

Sample IO:

Enter a series of 5 formulae:
1

2

3

=1

=2

The values are:
1

2

3

2

3
