`ifdef  UE_BASE_TEST_SV
`define UE_BASE_TEST_SV

class ue_base_test extends uvm_test;
    ue_env      env;
    `uvm_componet_untils(ue_base_test)
    extern virtual function new(string name = "ue_base_test",uvm_componet parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void report_phase(uvm_phase phase);
endclass

function ue_base_test::new(string name = "ue_base_test",uvm_componet parent = null);
    super.new(name,parent);
    `uvm_info(get_type_name(),$sformatf("create"),UVM_LOW)
endfunction 

function void ue_base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ue_env::type_id::create("env",this);
     `uvm_info(get_type_name(),$sformatf("build"),UVM_LOW);
endfunction

function void ue_base_test::report_phase(uvm_phase phase);
    int err_num;
    uvm_report_server server;
    super.report_phase(phase);

    server = get_report_server();
    err_num = server.get_severity_count(UVM_ERR);

    if(err_num != 0)
        `uvm_info(get_type_name,$sformatf("err_num:%0d TEST CASE FAILED",err_num),UVM_LOW)
    else
        `uvm_info(get_type_name,$sformatf("TEST CASE PASSED"),UVM_LOW)
endfunction

`endif UE_BASE_TEST_SV



