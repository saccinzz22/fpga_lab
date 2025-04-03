module alu (
    input [2:0] opcode,
    input [3:0] A, B,
    output reg [7:0] result
);
    
    always @(*) begin
        case (opcode)
            3'b000: result = {A, ~B}; // Example operation
            3'b001: result = {A, B};  // Example operation
            3'b010: result = {A >> 1, B >> 1}; // Right shift
            3'b011: result = A + B;  // Addition
            3'b100: result = A - B;  // Subtraction
            3'b101: result = A * B;  // Multiplication
            3'b110: result = (B != 0) ? (A / B) : 8'b00000000; // Division, avoiding division by zero
            3'b111: result = {A << 1, B << 1}; // Left shift
            default: result = 8'b00000000; // Default case
        endcase
    end
endmodule

module testbench;
    reg [2:0] opcode;
    reg [3:0] A, B;
    wire [7:0] result;
    
    alu uut (.opcode(opcode), .A(A), .B(B), .result(result));
    
    initial begin
        // Test cases
        opcode = 3'b000; A = 4'b0011; B = 4'b0101; #10;
        opcode = 3'b001; A = 4'b1001; B = 4'b0010; #10;
        opcode = 3'b011; A = 4'b0101; B = 4'b0011; #10;
        opcode = 3'b100; A = 4'b1100; B = 4'b0110; #10;
        opcode = 3'b101; A = 4'b0011; B = 4'b0010; #10;
        opcode = 3'b110; A = 4'b1000; B = 4'b0010; #10;
        opcode = 3'b111; A = 4'b0111; B = 4'b0001; #10;
        
        $stop;
    end
endmodule
