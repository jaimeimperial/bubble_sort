`ifndef SORTING_SCOREBOARD_SV
`define SORTING_SCOREBOARD_SV

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "sorting_transaction.svh"

class scoreboard extends uvm_scoreboard;
    `uvm_component_utils(scoreboard)
    
    // Analysis port for receiving transactions from the monitor.
    uvm_analysis_imp#(transaction, scoreboard) mon_imp;
    int array_size;
    bit pass = 1;
    
    function new(string name = "scoreboard", uvm_component parent=null);
        super.new(name, parent);
        mon_imp = new("mon_imp", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Retrieve array_size from config, defaulting to 16 if not set.
        if (!uvm_config_db#(int)::get(this, "", "ARRAY_SIZE", array_size))
            array_size = 16;
    endfunction

    virtual function void write(transaction tr);
        // Create a local copy for expected sorted data.
        bit [31:0] expected [ ];
        expected = new[array_size];
        
        // Copy the input data into expected array.
        for (int i = 0; i < array_size; i++) begin
            expected[i] = tr.input_data[i];
        end

        // Sort the expected array using a simple bubble sort.
        for (int i = 0; i < array_size - 1; i++) begin
            for (int j = i+1; j < array_size; j++) begin
                if(expected[i] > expected[j]) begin
                    bit [31:0] temp = expected[i];
                    expected[i] = expected[j];
                    expected[j] = temp;
                end
            end
        end

        // Compare expected sorted array with the DUT's output.
        for (int i = 0; i < array_size; i++) begin
            if (tr.sorted_data[i] !== expected[i]) begin
                pass = 0;
                `uvm_error("SCOREBOARD", $sformatf("Mismatch at index %0d: expected %0d, got %0d",
                                                   i, expected[i], tr.sorted_data[i]));
            end
        end

        if (pass) begin
            `uvm_info("SCOREBOARD", "Sorted transaction verified successfully!", UVM_MEDIUM);
        end else begin
            `uvm_error("SCOREBOARD", "Sorted transaction verification failed!");
        end

        // Assertion: Check that each element is less than or equal to the next.
        for (int i = 0; i < array_size - 1; i++) begin
            assert (tr.sorted_data[i] <= tr.sorted_data[i+1])
                else `uvm_error("SCOREBOARD", $sformatf("Assertion failed: sorted_data[%0d] <= sorted_data[%0d]", i, i+1));
        end
    endfunction
endclass

`endif
