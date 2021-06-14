module Sal7711Gen
	class Ability  < Sip::Ability

    BASICAS_PROPIAS = [
      ['Sal7711Gen', 'categoriaprensa']
    ]
    def tablasbasicas 
      Sip::Ability::BASICAS_PROPIAS + BASICAS_PROPIAS - [
        ['Sip', 'clase'],
        ['Sip', 'etiqueta'],
        ['Sip', 'grupo'],
        ['Sip', 'oficina'],
        ['Sip', 'perfilorgsocial'],
        ['Sip', 'sectororgsocial'],
        ['Sip', 'tclase'],
        ['Sip', 'tdocumento'],
        ['Sip', 'trelacion'],
        ['Sip', 'trivalente'],
        ['Sip', 'tsitio']
      ] 
    end

    BASICAS_ID_NOAUTO = []
    # Hereda basicas_id_noauto de sip
   
    NOBASICAS_INDSEQID =  []
    # Hereda nobasicas_indice_seq_con_id de sip
   
    BASICAS_PRIO = []
    # Hereda tablasbasicas_prio de sip

	end
end
