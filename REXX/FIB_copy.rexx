/**REXX*************************************************************************
* Licensed Materials - Property of IBM
* (C) Copyright IBM Corporation 2022. All Rights Reserved.
*
*
* Use, duplicaton or disclosure restricted by GSA ADP Schedule
* Cont
*******************************************************************************/

fibonacci(6)  

/*******************************************************************************
* Prints the fibonacci sequence up to a provided index to the output stream.
*******************************************************************************/
fibonacci:
    arg n
    say "Fibonacci sequence up to" n
    say format_fib(0, 0)
    say format_fib(1, 1)
    fibonacci.0 = 0
    fibonacci.1 = 1
    do i = 2 to n by 1
        j = i - 1
        k = i - 2
        fibonacci.i = fibonacci.j + fibonacci.k
        say format_fib(i, fibonacci.i)
    end
    exit

/*%INCLUDE FIBFORM */
