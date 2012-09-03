Rails.application.routes.draw do
   devise_for :users , :controllers => {:registrations => "users"} do

    # giving mcms namespace /prefix
    get "mcms/users/login",:to => "devise/sessions#new"
    get "mcms/users/logout",:to => "devise/sessions#destroy"
    get "mcms/users",:to => "users#index"
    get "mcms/users/new",:to => "users#new"
    post "mcms/users", :to => "users#create"
    post "mcms/users_first", :to => "users#first_user_create"
    get "mcms/users/edit/:id",:to => "users#edit"
    put "mcms/update_user",:to => "users#update"
    delete "mcms/destroy_user",:to => "users#destroy_user"
    get "mcms/first_user", :to => "users#first_user"

  end

  resources :users, :controller => "users", :except => [:create, :update]

  resources :roles ,:path => 'mcms/role' # with proper namespace/prefix

  match "mcms/roles",:to => "roles#index" # namespacing roles



  root :to => "home#index" # home page
end

