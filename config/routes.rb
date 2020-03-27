Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  resources :posts do
    resources :comments, except: [:index]
  end

  #resources :posts, only: [] do
    resources :comments, only: [:create, :destroy] do
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  root 'home#landing'
  get 'about' => 'home#about'
  get '/404', to: 'errors#not_found'

end
