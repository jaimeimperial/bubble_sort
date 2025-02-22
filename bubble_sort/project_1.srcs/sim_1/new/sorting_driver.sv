`ifndef SORTING_DRIVER_SV
`define SORTING_DRIVER_SV

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "sorting_sequence.sv"

class driver extends uvm_driver #(transaction);
    `uvm_component_utils(driver)

    function new(input string name = "driver",input uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    virtual sort_if vif;
    int array_size;
    

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db#(virtual sort_if)::get(this, "", "vif", vif)) begin
            uvm_config_db#(virtual sort_if)::dump();
            `uvm_fatal("DRIVER", "Failed to get virtual interface")
            uvm_config_db#(virtual sort_if)::dump();
        end else begin
            `uvm_info("DRIVER", "Successfully retrieved virtual interface!", UVM_MEDIUM)
        end
        
        if (!uvm_config_db#(int)::get(this, "", "ARRAY_SIZE", array_size)) begin
            array_size = 16;
        end
        
        if (vif == null) begin
            `uvm_fatal("DRIVER", "Virtual interface is NULL after retrieval")
        end else begin
            `uvm_info("DRIVER", "Successfully retrieved virtual interface!", UVM_MEDIUM)
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        transaction tr;
        forever begin
            `uvm_info("DRV", $sformatf("Wait for item from sequencer"), UVM_HIGH)
            seq_item_port.get_next_item(tr);
            
            if (tr == null) begin
                `uvm_fatal("DRIVER", "Transaction object is NULL!")
            end
            
            @(negedge ap_rst);
            // Provide stimulus to q0 directly
            for (int i = 0; i < 20; i++) begin
                // You can generate random data, for example:
                vif.input_arr_q0 = tr.input_data[i];
                @(posedge ap_clk);
            end

            
            vif.ap_start = 1;
            @(posedge vif.ap_clk);
            vif.ap_start = 0;
            
            wait(vif.ap_done);
            
            for (int i = 0; i < array_size; i++) begin
                vif.input_arr_address0 = i;
                @(posedge vif.ap_clk);
                tr.sorted_data[i] = vif.input_arr_q0;
            end
            seq_item_port.item_done();
        end
    endtask
    
endclass
`endif