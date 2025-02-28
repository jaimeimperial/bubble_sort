#include "bubble_sort_header.hpp"

#ifdef ENABLE_ERROR_CHECKING
void check_error(bool condition, int errorCode, int &errorFlag) {
    #pragma HLS INLINE off // Ensures that it is generated as a separate hardware module in synthesis
    if (condition) {
        errorFlag = errorCode;
    }
}
#endif

void bubble_sort(data_t M[size], int &errorFlag) {
    // Preconditions
    #ifdef ENABLE_ERROR_CHECKING
    #pragma HLS INTERFACE ap_none port=errorFlag
    check_error(size < 1, 101, errorFlag);
    if (errorFlag) { return; }
    #endif
    // -------------

    for (int i = 0; i < size - 1; i++) {
        // Outer Loop Invariants: Loop invariant on entry
        #ifdef ENABLE_ERROR_CHECKING
        check_error(i < 0 || i >= size - 1, 1020, errorFlag);
        if (errorFlag) { return; }
        #endif
        // -----------------------------------

        int A = M[i];        
        for (int j = i + 1; j < size; j++) {
            // Inner Loop Invariants: Loop invariant on entry
            #ifdef ENABLE_ERROR_CHECKING
            check_error(size < j, 1030, errorFlag);
            check_error(A != M[i], 1040, errorFlag);
            for (int k = i; k < j; k++) {
                check_error(M[i] > M[k], 1050, errorFlag);
                check_error(A != M[i], 1060, errorFlag);
                for (int k = i; k < j; k++){
                    check_error(M[i] > M[k], 1070, errorFlag);
                };
            };
            if (errorFlag) { return; }
            #endif
            // -----------------------------------       

            int B = M[j];
            if (A > B) {
                M[i] = B;
                M[j] = A;
                A = B;
            };

            // Inner Loop Invariantss: Loop invariant is maintained
            #ifdef ENABLE_ERROR_CHECKING
            check_error(size < j, 1031, errorFlag);
            check_error(A != M[i], 1041, errorFlag);
            for (int k = i; k < j; k++) {
                check_error(M[i] > M[k], 1051, errorFlag);
                check_error(A != M[i], 1061, errorFlag);
                for (int k = i; k < j; k++){
                    check_error(M[i] > M[k], 1071, errorFlag);
                };
            };
            if (errorFlag) { return; }
            #endif
            // -----------------------------------------
        };

        // Outer loop Invariants: Ensures that the loop invariant is maintained
        #ifdef ENABLE_ERROR_CHECKING
        check_error(i < 0 || i >= size - 1, 1021, errorFlag);
        if (errorFlag) { return; }
        #endif
        // ---------------------------------------------------------
    };

    // Postcondition
    #ifdef ENABLE_ERROR_CHECKING
    check_error(!is_sorted(M, 0, size, size, errorFlag), 114, errorFlag);
    #endif
    // -------------
};

#ifdef ENABLE_ERROR_CHECKING
bool is_sorted(data_t *M, int x, int y, int size, int &errorFlag) {
    #pragma HLS INLINE off

    // requires 0 <= x <= y <= this.M.Length
    check_error(x < 0 || y < x || size < y, 201, errorFlag);
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
#endif