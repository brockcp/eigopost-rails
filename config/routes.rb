Rails.application.routes.draw do

  root 'home#landing'

  get 'home/about'

end
