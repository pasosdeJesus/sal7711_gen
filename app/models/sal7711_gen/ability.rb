# encoding: UTF-8
module Sal7711Gen
	class Ability  < Sip::Ability

    BASICAS_PROPIAS = [
      ['Sal7711Gen', 'categoriaprensa']
    ]

    @@tablasbasicas = Sip::Ability::BASICAS_PROPIAS + BASICAS_PROPIAS - [
      ['Sip', 'tdocumento'],
      ['Sip', 'clase'],
      ['Sip', 'etiqueta'],
      ['Sip', 'oficina'],
      ['Sip', 'tclase'],
      ['Sip', 'tdocumento'],
      ['Sip', 'trelaciones'],
      ['Sip', 'tsitio']
    ] 

	end
end
