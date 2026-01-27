module l_ltf_ram #(
parameter integer ADDR_W = 6,
parameter integer N_SAMP = 64
)(
    input wire clk,
    input wire we,
    input  wire [ADDR_W-1:0]     waddr,
    input  wire [31:0]          wdata,

    // read port (async)
    input  wire [ADDR_W-1:0]     raddr,
    output wire [31:0]          rdata
);
 reg [31:0] mem [0:N_SAMP-1];

 initial begin

              mem[0] = {32'h14000000};
              mem[1] = {32'hFF58F099};
              mem[2] = {32'h0517F1C6};
              mem[3] = {32'h0C650A99};
              mem[4] = {32'h02B40392};
              mem[5] = {32'h07A8F4C6};
              mem[6] = {32'hF143F8F0};
              mem[7] = {32'hFB18F269};
              mem[8] = {32'h0C7CFCB0};
              mem[9] = {32'h06D40086};
              mem[10] = {32'h0020F148};
              mem[11] = {32'hEE7DF9EF};
              mem[12] = {32'h0322F882};
              mem[13] = {32'h0782FE16};
              mem[14] = {32'hFD1F1490};
              mem[15] = {32'h0F43FF7A};
              mem[16] = {32'h0800F800};
              mem[17] = {32'h04BA0C97};
              mem[18] = {32'hF8AD0508};
              mem[19] = {32'hEF330859};
              mem[20] = {32'h0A860BD2};
              mem[21] = {32'h08E701CF};
              mem[22] = {32'hF8480A68};
              mem[23] = {32'hF8C6FD36};
              mem[24] = {32'hFB84ECB0};
              mem[25] = {32'hF066FDE1};
              mem[26] = {32'hEFB4FD60};
              mem[27] = {32'h099CF686};
              mem[28] = {32'hFFA406E2};
              mem[29] = {32'hF43D0EBD};
              mem[30] = {32'h0BBD0D8D};
              mem[31] = {32'h01930C7E};
              mem[32] = {32'hEC000000};
              mem[33] =  {32'h0193F382};
              mem[34] = {32'h0BBDF273};
              mem[35] = {32'hF43DF143};
              mem[36] =  {32'hFFA4F91E};
              mem[37] = {32'h099C097A};
              mem[38] = {32'hEFB402A0};
              mem[39] = {32'hF066021F};
              mem[40] =  {32'hFB841350};
              mem[41] = {32'hF8C602CA};
              mem[42] = {32'hF848F598};
              mem[43] = {32'h08E7FE31};
              mem[44] = {32'h0A86F42E};
              mem[45] = {32'hEF33F7A7};
              mem[46] = {32'hF8ADFAF8};
              mem[47] = {32'h04BAF369};
              mem[48] = {32'h08000800};
              mem[49] = {32'h0F430086};
              mem[50] = {32'hFD1FEB70};
              mem[51] = {32'h078201EA};
              mem[52] = {32'h0322077E};
              mem[53] = {32'hEE7D0611};
              mem[54] = {32'h00200EB8};
              mem[55] = {32'h06D4FF7A};
              mem[56] =  {32'h0C7C0350};
              mem[57] = {32'hFB180D97};
              mem[58] = {32'hF1430710};
              mem[59] = {32'h07A80B3A};
              mem[60] = {32'h02B4FC6E};
              mem[61] = {32'h0C65F567};
              mem[62] = {32'h05170E3A};
              mem[63] = {32'hFF580F67};
              
 end

 // async read: immediate
    assign rdata = mem[raddr];

    // sync write: updates on clock
    always @(posedge clk) begin
        if (we) begin
            mem[waddr] <= wdata;
        end
    end

endmodule