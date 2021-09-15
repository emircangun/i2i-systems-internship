#pragma once

#include <chrono>
#include <iostream>

struct Timer
{
    std::chrono::time_point<std::chrono::high_resolution_clock> start, end;

    Timer()
    {
        start = std::chrono::high_resolution_clock::now();
    }

    ~Timer()
    {
        end = std::chrono::high_resolution_clock::now();
        auto nanosec = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
        std::cout << "Timer took " << nanosec << "ns" << std::endl;
    }

};