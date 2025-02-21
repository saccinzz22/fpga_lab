

   module serial_adder(
    input clk,
    input rst,
    input a,  // Serial input A
    input b,  // Serial input B
    output reg sum, // Serial sum output
    output reg cout // Carry-out
);

    reg carry; // Internal carry storage

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 0;
            carry <= 0;
            cout <= 0;
        end 
        else begin
            {carry, sum} <= a + b + carry; // Full adder logic
            cout <= carry; // Update carry-out
        end
    end

endmodule

module tb_serial_adder;
    reg clk, rst;
    reg a, b;
    wire sum, cout;

    // Instantiate the Serial Adder module
    serial_adder uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    reg [3:0] A, B;  // 4-bit registers for inputs
    integer i;

    // Clock Generation
    always #5 clk = ~clk;  // 10ns period

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;

        // **Test Case 1: Simple Addition (3 + 5 = 8)**
        A = 4'b0011; // 3
        B = 4'b0101; // 5
        for (i = 0; i < 4; i = i + 1) begin
            a = A[i];
            b = B[i];
            #10;
        end

        // **Test Case 2: Carry Propagation (7 + 1 = 8)**
        A = 4'b0111; // 7
        B = 4'b0001; // 1
        for (i = 0; i < 4; i = i + 1) begin
            a = A[i];
            b = B[i];
            #10;
        end

        // **Test Case 3: Overflow Case (15 + 1 = 16)**
        A = 4'b1111; // 15
        B = 4'b0001; // 1
        for (i = 0; i < 4; i = i + 1) begin
            a = A[i];
            b = B[i];
            #10;
        end

        $finish;
    end
endmodule
