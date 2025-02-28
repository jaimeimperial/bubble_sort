#ifndef BUBBLE_SORT_HPP
#define BUBBLE_SORT_HPP

// Synthesizes Error checking functions. Comment line to disable synthesis
//#define ENABLE_ERROR_CHECKING

#include <ap_int.h>

typedef ap_uint<32> data_t;
const int size = 20;
const int errorFlag = 0;
const int x = 0;
const int y = 20;

void bubble_sort(data_t M[size], int &errorFlag);

bool is_sorted(data_t M[size], int x, int y, int size, int &errorFlag);

void check_error(bool condition, int errorCode, int &errorFlag);

#endif