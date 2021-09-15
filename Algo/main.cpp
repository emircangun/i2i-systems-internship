#include <iostream>
#include <ctime>
#include <cstdlib>
#include <map>

#include "properties.h"

template <class T>
size_t fillArrayRandom(T** arr, size_t __MAX)
{
#if DEBUG
    __MAX = ARRAY_LIMIT;
#endif
    *arr = new int[__MAX];
    for (size_t i = 0; i < __MAX; ++i)
        (*arr)[i] = rand() % PRECISION;
    
    return __MAX;
}

template <class T>
void findDuplicatedElementsInArray(T* arr, size_t size)
{
    std::map<T, bool> element_map;
    for (size_t i = 0; i < size; ++i)
    {
        // if element is in the map and not writen yet
        if (element_map.find(arr[i]) != element_map.end() && element_map[arr[i]] == false)
        {
            std::cout << arr[i] << std::endl;
            element_map[arr[i]] = true;
        }
        // if element is not in the map
        else if (element_map.find(arr[i]) == element_map.end())
            element_map[arr[i]] = false; // writen is false
    }
}

template<class T>
void printArray(T* arr, size_t size)
{
    for (size_t i = 0; i < size; ++i)
        std::cout << arr[i] << " ";
    std::cout << std::endl;
}

int main()
{
    srand(time(NULL));

    int* arr = NULL;
    size_t size = fillArrayRandom(&arr, 10);

    findDuplicatedElementsInArray(arr, size);

#if DEBUG
    printArray(arr, size);
#endif

    delete [] arr;
    return 0;
}