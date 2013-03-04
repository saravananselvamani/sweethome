Sweethome::Application.routes.draw do
  resources :homes do 
    resources :images, :except => [:index, :update, :new, :edit, :create]
  end
  match '/images' => 'images#create', :via => :post
  match '/images/:image_id' => 'images#get', :via => :get
end
