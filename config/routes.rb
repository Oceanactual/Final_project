Rails.application.routes.draw do
  # Routes for the Character resource:

  # CREATE
  post("/insert_character", { :controller => "characters", :action => "create" })
          
  # READ
  get("/characters", { :controller => "characters", :action => "index" })
  
  get("/characters/:path_id", { :controller => "characters", :action => "show" })
  get("/characters_edit/:path_id", { :controller => "characters", :action => "edit" })
  
  # UPDATE
  
  post("/modify_character/:path_id", { :controller => "characters", :action => "update" })
  
  # DELETE
  get("/delete_character/:path_id", { :controller => "characters", :action => "destroy" })

  #------------------------------

  devise_for :installs

  devise_for :users
  root to: "character#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get("/", {:controller => "character", :action => "home"})
  # get("/character_list", {:controller => "character", :action =>"home"})
  get("/users/edit_profile", {:controller => "character", :action => "edit"})
  post("/save_character", {:controller => "character", :action => "save"})
  get("/characters_list/:id", {:controller => "character", :action => "show"})

end
