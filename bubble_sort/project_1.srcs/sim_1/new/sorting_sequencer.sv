`ifndef SORTING_SEQUENCER_SV
`define SORTING_SEQUENCER_SV

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "sorting_transaction.svh"

class sequencer extends uvm_sequencer#(transaction);
    `uvm_component_utils(sequencer)
    
    function new(string name = "sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
`endif