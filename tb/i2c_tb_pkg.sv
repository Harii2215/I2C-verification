interface i2c_if;
  logic clk;
  logic rst;
  logic newd;
  logic op;   
  logic [7:0] din;
  logic [6:0] addr;
  logic [7:0] dout;
  logic done;
  logic busy, ack_err;  
endinterface





module tb;
  i2c_if vif();
  i2c_top dut (vif.clk, vif.rst, vif.newd, vif.op, vif.addr, vif.din, vif.dout, vif.busy, vif.ack_err, vif.done);
  
  initial vif.clk = 0;
  always #5 vif.clk = ~vif.clk;
  
  environment env;
  
  initial begin
    env = new(vif);
    env.gen.count = 20;
    env.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
