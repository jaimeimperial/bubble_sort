#include "bubble_sort_header.hpp"

void bubble_sort(data_t M[size]) {
    for (int i = 0; i < size - 1; i++) {
        int A = M[i];
        for (int j = i + 1; j < size; j++) {
            int B = M[j];
            if (A > B) {
                M[i] = B;
                M[j] = A;
                A = B;
            }
        };
    };
};