FinnaBeLocal::Application.routes.draw do
  resources :listings do
    collection do
      match 'search' => 'listings#index', :via => [:get, :post], :as => :search
    end
  end
  root to: 'static#home'
end
