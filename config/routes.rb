Sal7711Gen::Engine.routes.draw do
	get '/buscar' => 'buscar#index'
	get '/resultados' => 'buscar#resultados'

  #resources :casos, path_names: { new: 'nuevo', edit: 'edita' }

  namespace :admin do
    Ability.tablasbasicas.each do |t|
      if (t[0] == "Sal7711Gen") 
        c = t[1].pluralize
        resources c.to_sym, 
          path_names: { new: 'nueva', edit: 'edita' }
      end
    end
  end

end

