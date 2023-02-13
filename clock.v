module clock
#(
	parameter WIDTH = 32
)

(
	input  wire					clk,
	input  wire					reset,
	input  wire				    en,
	input  wire	    [WIDTH-1:0]	count_max,
	input  wire     [WIDTH-1:0]	count_max_hrs,
	
	output wire 				clr_sec,
	output wire	    [WIDTH-1:0]	count_sec,
	output wire                 clr_min,
	output wire	    [WIDTH-1:0]	count_min,
	output wire                 clr_hrs,
	output wire     [WIDTH-1:0] count_hrs
	

);


up_counter
#(
	.WIDTH		        (WIDTH	   )	
)

up_counter_sec(
.clk           (clk             ),
.reset         (reset           ),
.en            (en              ),
.clr           (clr_sec         ),
.count_max     (count_max       ),
.count         (count_sec       )
);


up_counter
#(
	.WIDTH		        (WIDTH	   )	
)

up_counter_min(
.clk           (clk         ),
.reset         (reset       ),
.en            (clr_sec     ),
.clr           (clr_min     ),
.count_max     (count_max   ),
.count         (count_min   )
);


up_counter
#(
	.WIDTH		        (WIDTH	   )	
)


up_counter_hrs(
.clk           (clk             ),
.reset         (reset           ),
.en            (clr_min         ),
.clr           (clr_hrs         ),
.count_max     (count_max_hrs   ),
.count         (count_hrs       )
);


endmodule