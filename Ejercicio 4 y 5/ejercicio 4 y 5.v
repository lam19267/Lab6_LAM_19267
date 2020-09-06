// Ejercicio 4
module blocking(clk1, a, c);
  input clk1, a;
  output c;

  wire i0, i1;
  reg e, f;

  always @ (posedge clk1) begin
    e=a;
    f=e;
  end
endmodule

module unblocking(clk2, a, c);
  input clk2, a;
  output c;

  wire i0, i1;
  reg e, f;

  always @ (posedge clk2) begin
    e<=a;
    f<=e;
  end
endmodule

module FFD4(input wire clk3, reset3, set3, input [3:0] D1, output reg [3:0] Q1);
    always @ (posedge clk3 or posedge reset3) begin
      if (reset3) begin
      	Q1 <= 4'b0;
      end
      else if (set3) begin
      	Q1 <= 4'b1111;
      end
      else
        	Q1 <= D1;
      end
endmodule
