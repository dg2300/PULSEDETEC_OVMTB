class pd_monitor extends ovm_monitor;

   virtual dut_interface dut_vi;

   `ovm_object_utils(pd_monitor)

   ovm_analysis_port #(pd_txn) item_collected_port ;

   pd_txn trans_collected ;

    function void build;
      super.build();
       begin 
         ovm_object obj;
         if_wrapper if_wr;
         get_config_object("if_wrapper",obj,0);
      assert ($cast(if_wr,obj));
    dut_vi = if_wr.dut_vi;
   end
 endfunction 

   function new  (string name = "pd_monitor", ovm_component parent=null);
       super.new (name, parent);
         item_collected_port = new("item_collected_port", this);
          trans_collected = new ();
   endfunction : new

 task run();
    forever begin
      // @(posedge dut_vi.clock)begin
     
        //  @(dut_vi.clock)begin
                 @(posedge  dut_vi.sig_in );
              if(!dut_vi.reset)begin
      // trans_collected.delay = dut_vi.delay ;    
     //trans_collected.sig_in = dut_vi.sig_in ;
      #(dut_vi.delay+1) ;
       trans_collected.sig_out = dut_vi.sig_out ;
       trans_collected.print();
       item_collected_port.write (trans_collected); //sig_out 
   end
 //    end
   end
 endtask 

endclass 
