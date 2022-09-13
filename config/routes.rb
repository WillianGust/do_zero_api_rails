Rails.application.routes.draw do
  resources :acessos_apis
  resources :tokens
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cidades', to: 'estados#lista_cidades'
  get '/bairros', to: 'estados#lista_bairros'
  get '/estados', to: 'estados#index'
  get '/estados-proxy', to: 'estados#proxy'
  
  
  root to: 'home#index'
  # root to: 'home'
end
