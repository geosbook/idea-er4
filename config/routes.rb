IdeaEr4::Application.routes.draw do

  resources :units

  match '/contexts/:id/list' => "contexts#list", via: 'get'
  match '/contexts/:id/geosmapslist' => "geosmaps#list", via: 'get'
  match '/missions/:id/newchild' => "missions#newchild", via: 'get'
  match '/roles/:id/newchild' => "roles#newchild", via: 'get'
  match '/geosmaps/:id/display' => "geosmaps#display", via: 'get'
  match '/geosmaps/:id/currentmap' => "geosmaps#currentmap", via: 'get'
  resources :assets
  resources :people
  resources :sites
  resources :missions do
    resources :missions
    resources :contexts do
      resources :geosmaps
    end
    
  end
  resources :roles do
    resources :roles
  end
  
  match '/roles/:id/newaccount' => "users#newaccount", via: 'get'
  match '/users/destroyaccount/:id' => "users#destroyaccount", via: 'delete'
  match '/users/:id/editaccount' => "users#edit", via: 'get'
  match '/users/:id/edit' => "users#edit", via: 'put'
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
  root 'static_pages#home'
  match "/register", to: 'users#new', via: 'get'
  match "/signin", to: 'sessions#new', via: 'get'
  match "/signout", to: 'sessions#destroy', via: 'delete'
  match "/help", to: 'static_pages#help', via: 'get'
  match "/about", to: 'static_pages#about', via: 'get'
  match "/contact", to: 'static_pages#contact', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
