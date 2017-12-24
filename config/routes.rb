Rails.application.routes.draw do

  resources :topics

  devise_for :users

  root 'home#landing'

  get 'home/about'

end
