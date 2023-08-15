Rails.application.routes.draw do
  devise_for :installs

  devise_for :users
  root to: "character#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get("/", {:controller => "character", :action => "home"})
  get("/users/edit_profile", {:controller => "character", :action => "edit"})
  get("/save_character", {:controller => "character", :action => "save"})

end
