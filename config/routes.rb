Rails.application.routes.draw do

  devise_for :users
  root 'home#landing'

  get 'home/about'

end
