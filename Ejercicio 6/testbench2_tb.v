
module testbench();

    reg clk, reset0, A0, B0, reset1, A1;
    wire Y0, Y1, Y2, Y3;
    wire [1:0] Sf, Sp;
    wire [2:0] SF, SP;


    ejercicio1 U0(A0, B0, clk, reset0, Y0, Sp, Sf);
    ejercicio3 U1(A1, clk, reset1, Y1, Y2, Y3, SP, SF);

    initial begin
          $display("\n");
          $display("Ejercicio 1");
          $display("reset A B Sf Sp / Y");
          $monitor("%b %b %b %b %b/ %b", reset0, A0, B0, Sf, Sp,Y0);
            clk = 0; reset0 = 0; A0 = 0; B0 = 0;
            #1 reset0 = 1;
            #1 reset0 = 0; A0 = 1; B0 =1;

    end

    initial begin
          #16
          $display("\n");
          $display("Ejercicio 3");
          $display("reset A SF SP / Y1 Y2 Y3");
          $monitor("%b %b %b %b/ %b %b %b", reset1, A1, SF, SP, Y1, Y2, Y3);
            clk = 0; reset1 = 0; A1 = 0;
            #1 reset1 = 1;
            #8 A1 = 1; reset1 = 1;

    end

    always
      #5 clk = ~clk;


    initial
        #100 $finish;

    initial begin
      $dumpfile("testbench2_tb.vcd");
      $dumpvars(0, testbench);
    end
endmodule
