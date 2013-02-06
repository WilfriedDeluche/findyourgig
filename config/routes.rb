Findyourgig::Application.routes.draw do

  scope '(:locale)', locale: /en|fr/ do

    devise_for :users, path: "profile", path_names: { 
                                                  sign_in: 'login', 
                                                  sign_out: 'logout',
                                                  registration: 'register' }

    authenticated :user do
      root to: 'home#index'
    end

    resources :bands
    match 'my_bands', to: 'bands#my_bands', as: 'my_bands', via: :get 

    root to: "home#index"
  end  
end
