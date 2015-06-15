# encoding: UTF-8
module Sal7711Gen
	class Ability  < Sip::Ability

    @@tablasbasicas = Sip::Ability::TABLAS_SIP - [
      ['Sip', 'tdocumento'],
      ['Sip', 'clase'],
      ['Sip', 'etiqueta'],
      ['Sip', 'oficina'],
      ['Sip', 'tclase'],
      ['Sip', 'tdocumento'],
      ['Sip', 'trelaciones'],
      ['Sip', 'tsitio'],
    ] + [
      ['Sal7711Gen', 'categoriaprensa']
    ]

    @@basicas_seq_con_id = Sip::Ability::TABLAS_SIP_SEQID + [
      ['Sal7711Gen', 'categoriaprensa']
    ]
      
	end
end
