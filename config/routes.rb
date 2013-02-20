Findyourgig::Application.routes.draw do

  scope '(:locale)', locale: /en|fr/ do

    devise_for :users, path: "profile", path_names: { 
                                                  sign_in: 'login', 
                                                  sign_out: 'logout',
                                                  registration: 'register' }

    authenticated :user do
      root to: 'home#index'
    end

    resources :bands do
      put "request_participation", on: :member
      get "members", on: :member
    end

    resources :band_participations, path: "my_bands", only: [:index, :create, :destroy] do
      put 'set_administration_rights', on: :member
    end

    resources :venues

    root to: "home#index"
  end  
end
