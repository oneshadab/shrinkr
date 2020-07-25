Rails.application.routes.draw do
  post '/api/shrink', to: 'url#shrink'

  get '/:digest', to: 'url#goto', as: 'goto'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
