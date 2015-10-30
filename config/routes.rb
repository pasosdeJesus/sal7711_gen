Sal7711Gen::Engine.routes.draw do

  get 'buscar/:id', to: 'buscar#mostraruno', as: 'buscar_mostraruno'
  get 'buscar' => 'buscar#index', as: 'buscar'
  get 'mundep' => 'buscar#mundep', as: 'buscar_mundep'
  get 'codigo' => 'admin/categoriaprensa#busca', as: 'categoriaprensa_busca'
  get 'articulos' => 'buscar#index', as: 'articulos'
  get 'bitacorausuario' => 'bitacora#usuario', as: 'bitacora_usuario'

  get "articulos/nuevo" => 'articulos#new'
  get "articulos/:id" => 'buscar#redirigeindex'

  resources :articulos, path_names: { new: 'nuevo', edit: 'edita' },
    only: [:edit, :update, :new, :create, :destroy]
  

  namespace :admin do
    ::Ability.tablasbasicas.each do |t|
      if (t[0] == "Sal7711Gen") 
        c = t[1].pluralize
        resources c.to_sym, 
          path_names: { new: 'nueva', edit: 'edita' }
      end
    end
  end

end

