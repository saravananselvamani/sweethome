Sweethome::Application.routes.draw do
  namespace :owner do
    resources :homes do
      collection do
        get 'search'
      end
    end
  end
  match '/images' => 'images#create', :via => :post
  match '/images/:image_id' => 'images#get', :via => :get
end
