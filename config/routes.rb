FinnaBeLocal::Application.routes.draw do
  resources :listings
  root to: 'static#home'
end
