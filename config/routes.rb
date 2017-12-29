Rails.application.routes.draw do

  resources :topics do
      resources :posts, except: [:index]
  end

  devise_for :users

  root 'home#landing'

  get 'about' => 'home#about'

end
