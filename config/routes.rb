Sal7711Gen::Engine.routes.draw do

  get 'buscar/:id', to: 'buscar#mostraruno'
  get 'buscar' => 'buscar#index'
  get 'mundep' => 'buscar#mundep'
  get 'codigo' => 'admin/categoriaprensa#busca'
  get 'articulos' => 'buscar#index'

  resources :articulos, path_names: { new: 'nuevo', edit: 'edita' },
    only: [:edit, :update, :new, :create, :destroy]
  

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

