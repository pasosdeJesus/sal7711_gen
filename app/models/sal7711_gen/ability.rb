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


    # Se definen habilidades con cancancan
    # Util en motores y aplicaciones de prueba
    # En aplicaciones es mejor escribir completo el modelo de autorización
    # para facilitar su análisis y evitar cambios inesperados al actualizar
    # motores
    # @usuario Usuario que hace petición
    def initialize_sal7711_gen(usuario = nil)
      initialize_sip(usuario)
      if usuario && usuario.rol then
        can :read, Sal7711Gen::Articulo
        case usuario.rol 
        when Ability::ROLANALI
        when Ability::ROLADMIN
          can :manage, Sal7711Gen::Articulo
        end
      end
    end

  end
end

