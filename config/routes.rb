Rails.application.routes.draw do


  resources :posts do
      resources :comments, except: [:index]
  end

  devise_for :users

  root 'home#landing'

  get 'about' => 'home#about'

end
