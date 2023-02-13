module tb_clock;
parameter           WIDTH = 32;

reg			        clk;
reg 		        reset;
reg				    en;
reg	    [WIDTH-1:0]	count_max;
reg	    [WIDTH-1:0]	count_max_hrs;

wire                clr_sec;
wire    [WIDTH-1:0]	count_sec;
wire                clr_min;
wire    [WIDTH-1:0]	count_min;
wire                clr_hrs;
wire    [WIDTH-1:0] count_hrs;

clock
#(
	.WIDTH		        (WIDTH  )	
)

clock_inst(
.clk           (clk             ),
.reset         (reset           ),
.en            (en              ),
.count_max     (count_max       ),
.count_max_hrs (count_max_hrs   ),
.clr_sec       (clr_sec         ),
.count_sec     (count_sec       ),
.clr_min       (clr_min         ),
.count_min     (count_min       ),
.clr_hrs       (clr_hrs         ),
.count_hrs     (count_hrs       )
);

initial
begin
clk = 0;
forever
#5 clk = ~clk;
end


initial 
begin

    $dumpfile("wave.vcd");
	$dumpvars(0, tb_clock);
	
reset     = 0;
en        = 0;	
count_max = 32'd59;
count_max_hrs = 32'd23;

@(posedge clk)
reset <= #1 1;
@(posedge clk)
reset <= #1 0;

@(posedge clk);
#1 en = 1;

repeat(7200) @(posedge clk);
#1 en = 0;

repeat(20)@(posedge clk);
$finish;
   
	
end

endmodule