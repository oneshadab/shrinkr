Rails.application.routes.draw do
  get '/api/shrink/:url', to: 'url#shrink'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
