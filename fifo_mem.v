module fifo_mem #(parameter DATA_WIDTH=8, parameter PTR_WIDTH=3)(
  input wclk, wrst_n, w_en,
  input rclk, rrst_n, r_en,
  input [DATA_WIDTH-1:0] w_data,
  input [PTR_WIDTH:0] write_addr, read_addr,
  output reg [DATA_WIDTH-1:0] r_data
);
  reg [DATA_WIDTH-1:0] mem [0: (1<<(PTR_WIDTH+1))-1];
  // Write logic
  always @(posedge wclk) if (w_en) mem[write_addr] <= w_data;
  // Read logic
  always @(posedge rclk) begin
    if (!rrst_n) r_data <= 0;
    else if (r_en) r_data <= mem[read_addr];
  end
endmodule
