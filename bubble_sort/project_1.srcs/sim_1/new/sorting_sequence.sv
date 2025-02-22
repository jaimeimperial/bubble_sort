`ifndef SORTING_SEQUENCE_SV
`define SORTING_SEQUENCE_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

class sort_sequence extends uvm_sequence#(transaction);
    `uvm_object_utils(sort_sequence)
    
    function new(string name = "sort_sequence");
        super.new(name);
    endfunction
    
    virtual task body();
        transaction tr;
        int array_size;
        
        if (!uvm_config_db#(int)::get(null, "uvm_test_top", "ARRAY_SIZE", array_size))
            array_size = 16;
        
        `uvm_info("SEQ", $sformatf("Generating a transaction with array size %0d", array_size), UVM_MEDIUM)
        
        // Create and configure the transaction.
        tr = transaction::type_id::create("tr");
        if (tr == null)
            `uvm_fatal("SEQ", "Failed to create transaction");
            
        tr.set_array_size(array_size);
        if (!tr.randomize())
            `uvm_error("SEQ", "Randomization failed");
        
        // Use start_item() and finish_item() to send the transaction.
        start_item(tr);
        finish_item(tr);
        
        `uvm_info("SEQ", "Transaction successfully sent to the driver!", UVM_MEDIUM)
    endtask
endclass
`endif

