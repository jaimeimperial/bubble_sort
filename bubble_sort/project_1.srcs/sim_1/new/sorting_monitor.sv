`ifndef SORTING_MONITOR_SV
`define SORTING_MONITOR_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

class monitor extends uvm_monitor;
    `uvm_component_utils(monitor)
    
    virtual sort_if vif;
    uvm_analysis_port#(transaction) mon_port;
    int array_size;
    transaction tr;
    
    function new(string name = "monitor", uvm_component parent=null);
        super.new(name, parent);
        mon_port = new("mon_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual sort_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal("MONITOR", "Failed to get virtual interface")
        end
        if (!uvm_config_db#(int)::get(this, "", "ARRAY_SIZE", array_size)) begin
            array_size = 16;  // Default if not set
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        tr = transaction::type_id::create("tr");
        forever begin
             wait (vif.ap_done);
             `uvm_info("MONITOR", "ap_done asserted, capturing sorted data", UVM_MEDIUM)
             for(int i = 0; i < array_size; i++) begin
                vif.input_arr_address0 = i;
                @(posedge vif.ap_clk);
                tr.sorted_data[i] = vif.input_arr_q0;
             end
             `uvm_info("MONITOR", $sformatf("Captured sorted data: %p", tr.sorted_data), UVM_MEDIUM)
             
             mon_port.write(tr);
             `uvm_info("MONITOR", "Transaction written to analysis port", UVM_MEDIUM)
        end
    endtask
endclass
`endif