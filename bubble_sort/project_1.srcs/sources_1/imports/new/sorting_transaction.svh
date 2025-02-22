`ifndef SORTING_TRANSACTION_SVH
`define SORTING_TRANSACTION_SVH

import uvm_pkg::*;
`include "uvm_macros.svh"

class transaction extends uvm_sequence_item;
    `uvm_object_utils(transaction)
    
    int ARRAY_SIZE;
    rand bit unsigned [31:0] input_data[];
    bit unsigned [31:0] sorted_data[];
    
    function new(input string name = "transaction");
        super.new(name);
    endfunction
    
    function void set_array_size(input int size);
        this.ARRAY_SIZE = size;
        input_data = new[ARRAY_SIZE];
        sorted_data = new[ARRAY_SIZE];
    endfunction
   
    constraint data_range { foreach (input_data[i]) input_data[i] inside {[0:255]}; }
endclass
`endif