#include <iostream>
#include <cmath>

#include "Timer.h"

int FibonacciRecursive(int index)
{
    if (index <= 0)
        throw "Index must be positive.";
    if (index <= 2)
        return 1;

    return FibonacciRecursive(index - 1) + FibonacciRecursive(index - 2);
}

int FibonacciDynamic(int index)
{
    if (index <= 0)
        throw "Index must be positive.";
    if (index <= 2)
        return 1;

    int* fib = new int[index];
    fib[0] = fib[1] = 1;
    for (int i = 2; i < index; ++i)
        fib[i] = fib[i - 1] + fib[i - 2];
    return fib[index - 1];
}

int FibonacciFormulaForIndex(int index)
{
    if (index <= 0)
        throw "Index must be positive.";
    if (index <= 2)
        return 1;
        
    double phi = (1 + sqrt(5)) / 2;
    return round(pow(phi, index) / sqrt(5));
}

int main()
{
    std::cout << "Recursive: ";
    {
        Timer timer;
        FibonacciRecursive(2);
    }

    std::cout << "Dynamic Programming: ";
    {
        Timer timer;
        FibonacciDynamic(100);
    }

    std::cout << "Formula: ";
    {
        Timer timer;
        FibonacciFormulaForIndex(100);
    }

    return 0;
}
