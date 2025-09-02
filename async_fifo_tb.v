`timescale 1ns/1ps
module async_fifo_tb;
  reg wclk = 0, rclk = 0, wrst_n, w_en, r_en;
  reg [7:0] w_data;
  wire [7:0] r_data;
  wire full, empty;

  // Clock generation
  always #5  wclk = ~wclk;  // write clock
  always #7  rclk = ~rclk;  // read clock

  // Instantiate FIFO
  async_fifo_top #(8, 3) dut (
    .wclk(wclk), .wrst_n(wrst_n), .w_en(w_en), .w_data(w_data),
    .rclk(rclk), .rrst_n(wrst_n), .r_en(r_en),
    .r_data(r_data), .full(full), .empty(empty)
  );

  initial begin
    wrst_n = 0; w_en = 0; r_en = 0; w_data = 0;
    #20 wrst_n = 1;
    // Add write/read sequences, monitors, $display, finish
  end
endmodule
