#include "bubble_sort_header.hpp"

void bubble_sort(data_t M[size], int &errorFlag) {
    #pragma HLS INTERFACE ap_none port=errorFlag

    // Preconditions
    if (size < 1) { errorFlag = 1; }

    for (int i = 0; i < size - 1; i++) {
        // Outer Loop: Loop invariant on entry
        if ( i < 0 || i > size ) { errorFlag = 1; }

        int A = M[i];        
        for (int j = i + 1; j < size; j++) {
            // Inner Loop: Loop invariant on entry
            if (size > j) { errorFlag = 1; }
            if (A != M[i]) { errorFlag = 1; }
            for (int k = i; k < j; k++) {
                if (M[i] > M[k]) { errorFlag = 1; }
                if (A != M[i]) { errorFlag = 1; }
                for (int k = i; k < j; k++){
                    if (M[i] > M[k]) { errorFlag = 1; }
                };
            };        

            int B = M[j];
            if (A > B) {
                M[i] = B;
                M[j] = A;
                A = B;
            };

            // Inner Loop: Loop invariant is maintained
            if (size > j) { errorFlag = 1; }
            if (A != M[i]) { errorFlag = 1; }
            for (int k = i; k < j; k++) {
                if (M[i] > M[k]) { errorFlag = 1; }
                if (A != M[i]) { errorFlag = 1; }
                for (int k = i; k < j; k++){
                    if (M[i] > M[k]) { errorFlag = 1; }
                };
            };
        };

        // Outer loop: Ensures that the loop invariant is maintained
        if ( i < 0 || i > size ) { errorFlag = 1; }      
    };

    if (&is_sorted) {
        errorFlag = 0;
    }
    else {
        errorFlag = 1;
    }    
};

bool is_sorted(data_t M[size], int x, int y, int &errorFlag) {
    // requires 0 <= x <= y <= this.M.Length
    if (x < 0 || y < x || size < y) { errorFlag = 1; }
    if (errorFlag) { return false; } 

    if (y <= 1) { return true; }
    else {
        for (int i = x; i < y - 1; i++) {
            if (M[i] > M[i + 1]) {
                return false;
            }
        };
    };

    return true;
};