`timescale 1 ns / 1 ps 

module top_tb;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "bubble_sort_if.sv"
    `include "sorting_sequencer.sv"
    `include "sorting_driver.sv"
    `include "sorting_monitor.sv"
    `include "sorting_scoreboard.sv"
    `include "sorting_agent.sv"
    `include "sorting_env.sv"
    `include "sorting_test.sv"
    `include "sorting_sequence.sv"


    bit ap_clk;
    bit ap_rst;
    
    // Instantiate the Interface
    sort_if vif(ap_clk, ap_rst);

    // Instantiate the DUT
    bubble_sort dut (
        .ap_clk(vif.ap_clk),
        .ap_rst(vif.ap_rst),
        .ap_start(vif.ap_start),
        .ap_done(vif.ap_done),
        .ap_idle(vif.ap_idle),
        .ap_ready(vif.ap_ready),
        .input_arr_address0(vif.input_arr_address0),
        .input_arr_ce0(vif.input_arr_ce0),
        .input_arr_we0(vif.input_arr_we0),
        .input_arr_d0(vif.input_arr_d0),
        .input_arr_q0(vif.input_arr_q0),
        .input_arr_address1(vif.input_arr_address1),
        .input_arr_ce1(vif.input_arr_ce1),
        .input_arr_we1(vif.input_arr_we1),
        .input_arr_d1(vif.input_arr_d1),
        .input_arr_q1(vif.input_arr_q1)
    );
    
    always #10 ap_clk <= ~ap_clk;

    // Reset Initialization
    initial begin
      ap_clk = 0;
      ap_rst = 1;
      #20 ap_rst = 0;  // De-assert reset after 20ns
    end

    // Connect the virtual interface to UVM
    initial begin
      `uvm_info("TB", "Setting virtual interface", UVM_MEDIUM)
      uvm_config_db#(virtual sort_if)::set(null, "", "vif", vif);
      uvm_config_db#(virtual sort_if)::dump();
      run_test("test");  // Start UVM tes
    end

endmodule
