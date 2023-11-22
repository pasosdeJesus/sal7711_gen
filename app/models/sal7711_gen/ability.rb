module Sal7711Gen
	class Ability  < Msip::Ability

    BASICAS_PROPIAS = [
      ['Sal7711Gen', 'categoriaprensa']
    ]
    def tablasbasicas 
      Msip::Ability::BASICAS_PROPIAS + BASICAS_PROPIAS - [
        ['Msip', 'centropoblado'],
        ['Msip', 'etiqueta'],
        ['Msip', 'grupo'],
        ['Msip', 'oficina'],
        ['Msip', 'perfilorgsocial'],
        ['Msip', 'sectororgsocial'],
        ['Msip', 'tcentropoblado'],
        ['Msip', 'tdocumento'],
        ['Msip', 'trelacion'],
        ['Msip', 'trivalente'],
        ['Msip', 'tsitio']
      ] 
    end

    BASICAS_ID_NOAUTO = []
    # Hereda basicas_id_noauto de msip
   
    NOBASICAS_INDSEQID =  []
    # Hereda nobasicas_indice_seq_con_id de msip
   
    BASICAS_PRIO = []
    # Hereda tablasbasicas_prio de msip


    # Se definen habilidades con cancancan
    # Util en motores y aplicaciones de prueba
    # En aplicaciones es mejor escribir completo el modelo de autorización
    # para facilitar su análisis y evitar cambios inesperados al actualizar
    # motores
    # @usuario Usuario que hace petición
    def initialize_sal7711_gen(usuario = nil)
      initialize_msip(usuario)
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

