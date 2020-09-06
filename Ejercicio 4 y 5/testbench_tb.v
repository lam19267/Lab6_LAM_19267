module testbench();
  reg [3:0] D1;
  wire [3:0] Q1;
  reg clk3, set3, reset3;


  initial begin
    $display("FLIPFLOP Reset asincrono");
    $display("D CLK R | Q");
    $display("------|---");
    $monitor("%b %b %b %b  | %b  ", set3, clk3, reset3, D1, Q1);
       reset3 = 1; set3 = 1; D1 = 1100;  clk3 = 0;
    #5 reset3 = 0; set3 = 0; D1 = 0110;
    #5 reset3 = 0; set3 = 1; D1 = 1111;
    #5 reset3 = 0; set3 = 0; D1 = 0011;
    #5 reset3 = 0; set3 = 0; D1 = 1101;
  end


  always
    #5 clk3 = ~clk3;



  initial
    #30 $finish;

  initial begin
    $dumpfile("testbench1_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule
