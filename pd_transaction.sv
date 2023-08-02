import ovm_pkg::*;
`include "ovm_macros.svh"


class pd_txn extends ovm_sequence_item;

  `ovm_object_utils(pd_txn)


function new(string name="pd_txn") ;
super.new(name);
endfunction

rand time delay;
constraint limit_delay{delay < 10;}
logic sig_out;
logic sig_in;

endclass
