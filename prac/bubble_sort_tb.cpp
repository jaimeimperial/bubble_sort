#include <iostream>
#include <cstdlib>
#include <ap_int.h>
#include "bubble_sort_header.hpp"

typedef ap_uint<32> data_t;
#define SIZE 20

void bubble_sort(data_t M[SIZE], int &errorFlag); // Function prototype

int main() {
    ap_uint<32> test_data[SIZE];
    int errorFlag = 0;

    // Random test data
    std::cout << "Unsorted Data: ";
    for (int i = 0; i < SIZE; i++) {
        test_data[i] = rand() % 100;  // Rand Num 0-99
        std::cout << test_data[i] << " ";
    }
    std::cout << std::endl;

    // Call the sorting function
    bubble_sort(test_data, errorFlag);

    // Print sorted output
    std::cout << "Sorted Data: ";
    for (int i = 0; i < SIZE; i++) {
        std::cout << test_data[i] << " ";
    }
    std::cout << std::endl;

    if (!errorFlag) {
        std::cout << "Test Passed: Array is sorted correctly and assertions passed" << std::endl;
    } else {
        std::cout << "Test Failed: Array is not sorted correctly or assertions failed. Error Code: "<< errorFlag << std::endl;
    } 

    return 0;
}
