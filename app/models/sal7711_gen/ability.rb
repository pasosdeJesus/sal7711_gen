# encoding: UTF-8
module Sal7711Gen
	class Ability  < Sip::Ability

    @@tablasbasicas = Sip::Ability::TABLAS_SIP + [
      ['Sal7711Gen', 'categoriaprensa']
    ]

    @@basicas_seq_con_id = Sip::Ability::TABLAS_SIP_SEQID + [
      ['Sal7711Gen', 'categoriaprensa']
    ]
      
	end
end
