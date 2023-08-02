import ovm_pkg::*;

class pd_sequence extends ovm_sequence #(pd_txn);
  `ovm_object_utils(pd_sequence)

 function new(string name="pd_sequence");
  super.new(name);
endfunction

 task body;
   repeat (5)
    begin
     pd_txn txn;
     txn = pd_txn::type_id::create("txn");
     start_item(txn);
     assert(txn.randomize());
     finish_item(txn);
    end
 endtask

endclass
