module hamming_dec (
	input [6:0] data_in,
	output verify,
	output reg [3:0] ham_out
	);
	
	wire p0, p1, p2;
	
	//Paridade obtida a partir de funções xor
	assign p0 = {data_in[4] ^ data_in[3] ^ data_in[2] ^ data_in[0]}; 
	assign p1 = {data_in[5] ^ data_in[3] ^ data_in[1] ^ data_in[0]};
	assign p2 = {data_in[6] ^ data_in[2] ^ data_in[1] ^ data_in[0]};
	
	always @(data_in, p0, p1, p2) begin
		if(p0 == 0 && p1 == 0 && p2 == 0) begin
			ham_out = data_in[3:0];
			verify = 1'b0;
		end
		else verify = 1'b1;
	end
endmodule	
	