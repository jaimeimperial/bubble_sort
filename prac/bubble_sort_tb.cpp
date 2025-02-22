#include <iostream>
#include <cstdlib>
#include <ap_int.h>
#include "bubble_sort_header.hpp"

typedef ap_uint<32> data_t;
#define SIZE 20

void bubble_sort(data_t M[SIZE]); // Function prototype

int main() {
    ap_uint<32> test_data[SIZE];

    // Random test data
    std::cout << "Unsorted Data: ";
    for (int i = 0; i < SIZE; i++) {
        test_data[i] = rand() % 100;  // Rand Num 0-99
        std::cout << test_data[i] << " ";
    }
    std::cout << std::endl;

    // Call the sorting function
    bubble_sort(test_data);

    // Print sorted output
    std::cout << "Sorted Data: ";
    for (int i = 0; i < SIZE; i++) {
        std::cout << test_data[i] << " ";
    }
    std::cout << std::endl;

    // Verify correctness
    bool is_sorted = true;
    for (int i = 0; i < SIZE - 1; i++) {
        if (test_data[i] > test_data[i + 1]) {
            is_sorted = false;
            break;
        }
    }

    if (is_sorted) {
        std::cout << "Test Passed: Array is sorted correctly." << std::endl;
    } else {
        std::cout << "Test Failed: Array is not sorted correctly." << std::endl;
    }

    return 0;
}
