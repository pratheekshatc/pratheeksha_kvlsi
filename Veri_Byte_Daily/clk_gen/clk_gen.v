module clk_generation;
reg clk;
real freq=100;
real time_period , ton;
real duty=50;

initial begin
clk=0;
time_period=(1000/freq);
ton=(time_period*duty)/100;
# 1000 $finish;
end

always
begin
#(time_period-ton)clk=1;
#ton clk=0;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,clk);
end
endmodule
