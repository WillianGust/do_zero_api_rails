Rails.application.routes.draw do
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/estados', to: 'estados#index'
  get '/cidades', to: 'estados#lista_cidades'
  get '/bairros', to: 'estados#lista_bairros'

  root to: 'home#index'
  # root to: 'home'
end
