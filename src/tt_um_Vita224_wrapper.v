module tt_um_Vita224_top (
    input  wire [7:0] ui_in,    // Entradas de usuario
    output wire [7:0] uo_out,   // Salidas de usuario
    input  wire [7:0] uio_in,   // Entradas bidireccionales
    output wire [7:0] uio_out,  // Salidas bidireccionales
    output wire [7:0] uio_oe,   // Enable de bidireccionales
    input  wire       ena,      // Enable global
    input  wire       clk,      // Clock global
    input  wire       rst_n     // Reset global (activo en 0)
);

    // ==================================================================
    // Adaptación de pines de TinyTapeout a tu diseño VHDL
    // ==================================================================
    wire        clock_in         = ui_in[0];           // clock externo
    wire        reset            = ui_in[1];           // reset
    wire [1:0]  program_selector = ui_in[3:2];         // selector de programa
    wire        RxD              = ui_in[4];           // entrada UART

    wire [3:0]  Anode_Activate;
    wire [6:0]  LED_out;

    // No usamos IOs bidireccionales en este diseño
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Mapear outputs al bus de 8 bits
    // uo_out[3:0] = Anodos
    // uo_out[7:4] = LEDs bajos del display
    assign uo_out[3:0] = Anode_Activate;
    assign uo_out[7:4] = LED_out[3:0];  // parte baja del display

    // ==================================================================
    // Instancia del diseño VHDL
    // ==================================================================
    tt_um_Vita224_core uut (
        .clock_in(clock_in),
        .reset(reset),
        .program_selector(program_selector),
        .Anode_Activate(Anode_Activate),
        .LED_out(LED_out),
        .RxD(RxD)
    );

endmodule
