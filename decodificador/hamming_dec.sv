module hamming_dec (
	input [6:0] data_in,
	output [3:0] ham_out
	);
	
	wire p0, p1, p2;
	
	assign p0 = {data_in[4] ^ data_in[3] ^ data_in[2] ^ data_in[0]};
	assign p1 = {data_in[5] ^ data_in[3] ^ data_in[1] ^ data_in[0]};
	assign p2 = {data_in[6] ^ data_in[2] ^ data_in[1] ^ data_in[0]};
	
	assign ham_out[3:0] = (p0 == 0 && p1 == 0 && p2 == 0) ? data_in[3:0] : data_in[6:3];

endmodule	
	