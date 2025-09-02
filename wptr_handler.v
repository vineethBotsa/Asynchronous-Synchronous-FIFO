module wptr_handler #(parameter PTR_WIDTH=3) (
  input wclk, wrst_n, w_en,
  input [PTR_WIDTH:0] g_rptr_sync,
  output reg [PTR_WIDTH:0] b_wptr, g_wptr,
  output reg full
);
  reg [PTR_WIDTH:0] b_wptr_next, g_wptr_next;
  reg wrap_around;
  wire wfull;

  assign b_wptr_next = b_wptr + (w_en & !full);
  assign g_wptr_next = (b_wptr_next >> 1) ^ b_wptr_next;
  // Add full detection logic, e.g., Way 1 or Way 2
endmodule
