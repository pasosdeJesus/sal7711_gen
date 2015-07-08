# encoding: UTF-8
module Sal7711Gen
	class Ability  < Sip::Ability

    BASICAS_NUEVAS = [
      ['Sal7711Gen', 'categoriaprensa']
    ]

    @@tablasbasicas -= [
      ['Sip', 'tdocumento'],
      ['Sip', 'clase'],
      ['Sip', 'etiqueta'],
      ['Sip', 'oficina'],
      ['Sip', 'tclase'],
      ['Sip', 'tdocumento'],
      ['Sip', 'trelaciones'],
      ['Sip', 'tsitio'],
    ] 
    @@tablasbasicas += BASICAS_NUEVAS

    BASICAS_SID_NUEVAS = [
      ['Sal7711Gen', 'categoriaprensa']
    ]

    @@basicas_seq_con_id += BASICAS_SID_NUEVAS

	end
end
