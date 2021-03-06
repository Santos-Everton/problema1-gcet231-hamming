module hamming_cor(
	input [6:0] data_in_cor,
	input checker,
	input clk,
	output reg [3:0] data_out
);

	wire x[6:0] = data_in_cor[6:0];
	
	hamming_dec verify(.fail(checker), .ham_out(data_in_cor));
	
	always @(x, checker) begin
		if (checker == 0) data_out = data_in_cor[3:0];
		else begin
			if(p0 == 1 && p1 == 0 && p2 == 0) begin
				if(x[0] == 0) x[0] = 1;
				else x[0] = 0;
				data_out = x[3:0];
			end
			else if(p0 == 0 && p1 == 1 && p2 == 0) begin
				if(x[1] == 0) x[1] = 1;
				else x[1] = 0;
				data_out = x[3:0];
			end
			else if(p0 == 1 && p1 == 1 && p2 == 0) begin
				if(x[2] == 0) x[2] = 1;
				else x[2] = 0;
				data_out = x[3:0];
			end
			else if(p0 == 0 && p1 == 0 && p2 == 1) begin
				if(x[3] == 0) x[3] = 1;
				else x[3] = 0;
				data_out = x[3:0];
			end
			else if(p0 == 1 && p1 == 0 && p2 == 1) begin
				if(x[4] == 0) x[4] = 1;
				else x[4] = 0;
				data_out = x[3:0];
			end
			else if(p0 == 0 && p1 == 1 && p2 == 1) begin
				if(x[5] == 0) x[5] = 1;
				else x[5] = 0;
				data_out = x[3:0];
			end
			else if(p0 == 1 && p1 == 1 && p2 == 1) begin
				if(x[6] == 0) x[6] = 1;
				else x[6] = 0;
				data_out = x[3:0];
			end
		end
	end
	always @(posedge clk) begin
		data_out = data_in[3:0];
	end
	
endmodule