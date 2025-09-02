module async_fifo_top #(parameter DATA_WIDTH=8, PTR_WIDTH=3)(
  input wclk, wrst_n, w_en, [DATA_WIDTH-1:0] w_data,
  input rclk, rrst_n, r_en,
  output [DATA_WIDTH-1:0] r_data,
  output full, empty
);
  // Internal signal declarations
  // Instantiate synchronizers between domains
  // Instantiate write and read pointer handlers
  // Instantiate fifo_mem
  // Connect flags and signals appropriately
endmodule
