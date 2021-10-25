class Ability  < Sal7711Gen::Ability

  # Autorizaciones con CanCanCan
  def initialize(usuario = nil)
    initialize_sal7711_gen(usuario)
  end

end

