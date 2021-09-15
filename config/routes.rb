Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :module => 'devise', :controllers => {:registrations => "registrations"}
  authenticated :users do
    root 'home#dashboard', as: :authenticated_root
  end
  unauthenticated :users do
    root 'home#index', as: :unauthenticated_root
  end

  get "/", to: "home#index"

  resources "users"
  resources "registrations"
  resources "animes"
  resources "mangas"
  resources "favorites"

  namespace :api do
    resources "favorites" do
      collection do
        get "get-top-favorite", to: "favorites#get_top_favorite"
        get "get-total-user-favorite", to:"favorites#get_total_user_favorite"
      end
    end
  end
end
