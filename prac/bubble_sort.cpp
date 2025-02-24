#include "bubble_sort_header.hpp"

void bubble_sort(data_t M[size], int &errorFlag) {
    #pragma HLS INTERFACE ap_none port=errorFlag

    // Preconditions
    if (size < 1) { errorFlag = 101; return; }

    for (int i = 0; i < size - 1; i++) {
        // Outer Loop: Loop invariant on entry
        if ( i < 0 || i >= size - 1 ) { errorFlag = 102; return; }

        int A = M[i];        
        for (int j = i + 1; j < size; j++) {
            // Inner Loop: Loop invariant on entry
            if (size < j) { errorFlag = 103; return; }
            if (A != M[i]) { errorFlag = 104; return; }
            for (int k = i; k < j; k++) {
                if (M[i] > M[k]) { errorFlag = 105; return; }
                if (A != M[i]) { errorFlag = 106; return; }
                for (int k = i; k < j; k++){
                    if (M[i] > M[k]) { errorFlag = 107; return; }
                };
            };        

            int B = M[j];
            if (A > B) {
                M[i] = B;
                M[j] = A;
                A = B;
            };

            // Inner Loop: Loop invariant is maintained
            if (size < j) { errorFlag = 108; return; }
            if (A != M[i]) { errorFlag = 109; return; }
            for (int k = i; k < j; k++) {
                if (M[i] > M[k]) { errorFlag = 110; return; }
                if (A != M[i]) { errorFlag = 111; return; }
                for (int k = i; k < j; k++){
                    if (M[i] > M[k]) { errorFlag = 112; return; }
                };
            };
        };

        // Outer loop: Ensures that the loop invariant is maintained
        if ( i < 0 || i > size ) { errorFlag = 113; return; }      
    };

    if (is_sorted(M, 0, size, size, errorFlag) == false) {
        errorFlag = 114;
    }    
};

bool is_sorted(data_t *M, int x, int y, int size, int &errorFlag) {
    // requires 0 <= x <= y <= this.M.Length
    if (x < 0 || y < x || size < y) { errorFlag = 201; }
    if (errorFlag != 0) { return false; } 

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