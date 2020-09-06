

module FLIP (input clk, reset, D,
            output reg Y);
        always @ (posedge clk or posedge reset)begin
            if (reset) begin
                Y <= 1'b0;
            end
            else begin
                Y <= D;
            end
        end
endmodule


//Ejercicio 1

module ejercicio1(input A, B, clk, reset, output wire Y, output wire [1:0] S02, S12);
        wire S0, S1, S01, S11;
        assign S01 = (~S1 & ~S0 & A);
        assign S11 = (S0 & B) | (S1 & A & B);
        FLIP U1(clk, reset, S01, S0);
        FLIP U2(clk, reset, S11, S1);
        assign Y = (S1 & ~S0 & A & B);
        assign S02 = {S1 , S0};
        assign S12 = {S11, S01};

endmodule


//Ejercicio 3

module ejercicio3(input A, clk, reset, output wire Y1, Y2, Y3, output wire [2:0] S02, S12);
    wire S0, S1, S2, S00, S11, S22;

    assign S22 = (S2 & S1 & ~A) | (S2 & ~S0 & A) | (S2 & ~S1 & S0) | (~S2 & ~S1 & S0 & ~A) | (~S2 & S1 & S0 & A);
    assign S11 = (~S1 & ~S0 & ~A) | (S1 & S0 & ~A) | (S1 & ~S0 & A) | (~S1 & S0 & A);
    assign S00 = ~S0;

    FLIP U3(clk, reset, S22, S2);
    FLIP U4(clk, reset, S11, S1);
    FLIP U5(clk, reset, S00, S0);

    assign Y1 = S2;
    assign Y2 = (S2 & ~S1) | (~S2 & S1);
    assign Y3 = (S1 & ~S0) | (~S1 & S0);
    assign S02= {S2, S1, S0};
    assign S12= {S22, S11, S00};

endmodule
