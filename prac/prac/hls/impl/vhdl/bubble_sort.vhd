-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bubble_sort is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    M_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    M_ce0 : OUT STD_LOGIC;
    M_we0 : OUT STD_LOGIC;
    M_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    M_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    M_address1 : OUT STD_LOGIC_VECTOR (4 downto 0);
    M_ce1 : OUT STD_LOGIC;
    M_we1 : OUT STD_LOGIC;
    M_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    errorFlag : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of bubble_sort is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "bubble_sort_bubble_sort,hls_ip_2024_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010-clg225-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.196000,HLS_SYN_LAT=495,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=154,HLS_SYN_LUT=275,HLS_VERSION=2024_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv5_13 : STD_LOGIC_VECTOR (4 downto 0) := "10011";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal i_1_reg_146 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal A_reg_159 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal indvars_iv31_load_reg_164 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_done : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_idle : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_ready : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce0 : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we0 : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_address1 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce1 : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we1 : STD_LOGIC;
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal zext_ln10_fu_107_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln10_fu_95_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fu_44 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal add_ln15_fu_101_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal indvars_iv31_fu_48 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal add_ln10_fu_121_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal M_ce0_local : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component bubble_sort_bubble_sort_Pipeline_VITIS_LOOP_15_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        zext_ln10_1 : IN STD_LOGIC_VECTOR (4 downto 0);
        A : IN STD_LOGIC_VECTOR (31 downto 0);
        M_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        M_ce0 : OUT STD_LOGIC;
        M_we0 : OUT STD_LOGIC;
        M_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        M_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        M_address1 : OUT STD_LOGIC_VECTOR (4 downto 0);
        M_ce1 : OUT STD_LOGIC;
        M_we1 : OUT STD_LOGIC;
        M_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        zext_ln10 : IN STD_LOGIC_VECTOR (4 downto 0) );
    end component;



begin
    grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73 : component bubble_sort_bubble_sort_Pipeline_VITIS_LOOP_15_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start,
        ap_done => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_done,
        ap_idle => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_idle,
        ap_ready => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_ready,
        zext_ln10_1 => indvars_iv31_load_reg_164,
        A => A_reg_159,
        M_address0 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_address0,
        M_ce0 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce0,
        M_we0 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we0,
        M_d0 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_d0,
        M_q0 => M_q0,
        M_address1 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_address1,
        M_ce1 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce1,
        M_we1 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we1,
        M_d1 => grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_d1,
        zext_ln10 => i_1_reg_146);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_ready = ap_const_logic_1)) then 
                    grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_fu_44_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_fu_44 <= ap_const_lv5_0;
            elsif (((icmp_ln10_fu_95_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_fu_44 <= add_ln15_fu_101_p2;
            end if; 
        end if;
    end process;

    indvars_iv31_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                indvars_iv31_fu_48 <= ap_const_lv5_1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                indvars_iv31_fu_48 <= add_ln10_fu_121_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                A_reg_159 <= M_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_1_reg_146 <= i_fu_44;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                indvars_iv31_load_reg_164 <= indvars_iv31_fu_48;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_done, ap_CS_fsm_state5, icmp_ln10_fu_95_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln10_fu_95_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;

    M_address0_assign_proc : process(grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_address0, ap_CS_fsm_state5, zext_ln10_fu_107_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            M_address0 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_address0;
        else 
            M_address0 <= zext_ln10_fu_107_p1(5 - 1 downto 0);
        end if; 
    end process;

    M_address1 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_address1;

    M_ce0_assign_proc : process(grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce0, ap_CS_fsm_state5, M_ce0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            M_ce0 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce0;
        else 
            M_ce0 <= M_ce0_local;
        end if; 
    end process;


    M_ce0_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            M_ce0_local <= ap_const_logic_1;
        else 
            M_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    M_ce1_assign_proc : process(grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce1, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            M_ce1 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_ce1;
        else 
            M_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    M_d0 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_d0;
    M_d1 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_d1;

    M_we0_assign_proc : process(grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we0, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            M_we0 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we0;
        else 
            M_we0 <= ap_const_logic_0;
        end if; 
    end process;


    M_we1_assign_proc : process(grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we1, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            M_we1 <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_M_we1;
        else 
            M_we1 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln10_fu_121_p2 <= std_logic_vector(unsigned(indvars_iv31_fu_48) + unsigned(ap_const_lv5_1));
    add_ln15_fu_101_p2 <= std_logic_vector(unsigned(i_fu_44) + unsigned(ap_const_lv5_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_done)
    begin
        if ((grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state2, icmp_ln10_fu_95_p2)
    begin
        if (((icmp_ln10_fu_95_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln10_fu_95_p2)
    begin
        if (((icmp_ln10_fu_95_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    errorFlag <= ap_const_lv32_0;
    grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start <= grp_bubble_sort_Pipeline_VITIS_LOOP_15_2_fu_73_ap_start_reg;
    icmp_ln10_fu_95_p2 <= "1" when (i_fu_44 = ap_const_lv5_13) else "0";
    zext_ln10_fu_107_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_44),64));
end behav;
