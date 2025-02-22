`ifndef BUBBLE_SORT_IF_SV
`define BUBBLE_SORT_IF_SV

interface sort_if(input logic ap_clk, input logic ap_rst);
    logic ap_start;
    logic ap_done;
    logic ap_idle;
    logic ap_ready;
    
    logic [3:0] input_arr_address0, input_arr_address1;
    logic input_arr_ce0, input_arr_ce1;
    logic input_arr_we0, input_arr_we1;
    logic [31:0] input_arr_d0, input_arr_d1;
    logic [31:0] input_arr_q0, input_arr_q1;
    
endinterface
`endif