`ifndef SORTING_AGENT_SV
`define SORTING_AGENT_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

class agent extends uvm_agent;
    `uvm_component_utils(agent)
    
    function new(input string name = "agent", input uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    driver                              driver1;
    monitor                             monitor1;
    sequencer                           sequencer1;
    

    virtual function void build_phase(uvm_phase phase);
        driver1 = driver::type_id::create("driver", this);
        sequencer1 = sequencer::type_id::create("sequencer", this);
        monitor1 = monitor::type_id::create("monitor", this);
        
        if (!uvm_config_db#(virtual sort_if)::get(this, "", "vif", driver1.vif)) begin
            `uvm_fatal("AGENT", "Failed to pass virtual interface to driver")
        end else begin
            `uvm_info("AGENT", "Successfully passed virtual interface to driver", UVM_MEDIUM)
        end
        
        if (sequencer1 == null) begin
            `uvm_fatal("AGENT", "Sequencer failed to be created")
        end 
        if (driver1 == null) begin
            `uvm_fatal("AGENT", "Driver failed to be created")
        end
        if (!uvm_config_db#(virtual sort_if)::get(this, "", "vif", driver1.vif)) begin
            `uvm_fatal("AGENT", "Failed to pass virtual interface to driver")
        end
    endfunction
    
    virtual function void connect_phase(uvm_phase phase);
        driver1.seq_item_port.connect(sequencer1.seq_item_export);
    endfunction
     
endclass
`endif
