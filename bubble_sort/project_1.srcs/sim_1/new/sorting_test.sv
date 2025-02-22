`ifndef SORTING_TEST_SV
`define SORTING_TEST_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

class test extends uvm_test;
    `uvm_component_utils(test)
    
    environment env;  // Your environment should include your agent (which in turn instantiates the sequencer)
    int array_size = 20;
    
    function new(string name = "test", uvm_component parent = null);
        super.new(name, parent);
    endfunction
   
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Create your environment (which instantiates agent, sequencer, driver, etc.)
        env = environment::type_id::create("env", this);
        // Set the array size in the configuration database.
        uvm_config_db#(int)::set(this, "", "ARRAY_SIZE", array_size);
        uvm_top.print_topology();
    endfunction

    virtual task run_phase(uvm_phase phase);
        sort_sequence seq;  // Create a sequence instance.
        phase.raise_objection(this);
        
        seq = sort_sequence::type_id::create("seq");
        if (seq == null)
            `uvm_fatal("TEST", "Failed to create sequence");
        
        `uvm_info("TEST", "Starting sequence on sequencer", UVM_MEDIUM)
        // Start the sequence on an existing sequencer. Here we assume your environment's agent has a sequencer instance named "sequencer1".
        seq.start(env.agent1.sequencer1);
        
        phase.drop_objection(this);
    endtask

endclass
`endif