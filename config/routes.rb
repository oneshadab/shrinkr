Rails.application.routes.draw do
  post '/api/shrink/:url', to: 'url#shrink'

  get '/:guid', to: 'url#goto', as: 'goto'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
