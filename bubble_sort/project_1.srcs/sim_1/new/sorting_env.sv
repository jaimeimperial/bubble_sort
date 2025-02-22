`ifndef SORTING_ENV_SV
`define SORTING_ENV_SV

import uvm_pkg::*;
`include "uvm_macros.svh"


class environment extends uvm_env;
    `uvm_component_utils(environment)
    
    function new(input string name = "environment", input uvm_component parent=null);
        super.new(name, parent);
    endfunction

    agent           agent1;
    scoreboard      scoreboard1;


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent1 = agent::type_id::create("agent", this);
        scoreboard1 = scoreboard::type_id::create("scoreboard", this);
    endfunction
    
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent1.monitor1.mon_port.connect(scoreboard1.mon_imp);
    endfunction

endclass

`endif