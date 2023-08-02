module pulse_detector(
  input reg clk,
  input reg reset,
  input logic sig_in,
  input time delay,
  output logic sig_out);
  
  always @(posedge clk) begin
    if(reset)
      sig_out <= 0;
    else
       begin
         @(posedge sig_in) #delay sig_out<=1;
         #1 sig_out<=0;
       end
    end
endmodule


#                                                        ##########################
#                                                        #                        #
#                                         CLOCK--------->#                        #
#                                                        #                        #
#                                                        #                        #
#                                         RESET--------->#          DUT           #
#                                                        #                        #----------> SIG_OUT
#                                                        #                        #
#                                         SIGIN--------->#                        #
#                                                        #                        #
#                                                        #                        #
#                                         DELAY--------->#                        #
#                                                        ##########################