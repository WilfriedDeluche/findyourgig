Findyourgig::Application.routes.draw do

  scope '(:locale)', locale: /en|fr/ do

    devise_for :users, path: "profile", path_names: { 
                                                  sign_in: 'login', 
                                                  sign_out: 'logout',
                                                  registration: 'register' }

    authenticated :user do
      root to: 'home#index'
    end

    resources :users, path: "profile", only: [:show, :edit, :update]

    resources :bands do
      put "request_participation", on: :member
      get "members", on: :member

      resources :band_images, path: 'images', only: [:index, :create, :show, :destroy] do
        put "set_main", on: :member
      end
    end

    resources :band_participations, path: "my_bands", only: [:index, :destroy] do
      put 'set_administration_rights', on: :member
      put 'activate', on: :member
    end

    resources :managerships, path: "my_venues", only: [:index]

    resources :venues do
      get "gigs", on: :member
      resources :venue_images, path: 'images', only: [:index, :create, :show, :destroy] do
        put "set_main", on: :member
      end
      resources :feedbacks do
        resources :feedback_ratings
        resources :feedback_comments
      end
    end

    resources :gigs do
      get "poster", on: :member
      put "remove_poster", on: :member
    end

    match '/search', :to => 'home#search'

    root to: "home#index"
  end  
end
