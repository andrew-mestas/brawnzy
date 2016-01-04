Rails.application.routes.draw do

  root 'main#index'
  get '/' => 'main#index'
  
  # get 'oauth/callback'
  # get 'oauth/logout'
  # get 'oauth/failure'
  # post 'user/new' 

  # provider routes for facebook/auth controller
  # get 'auth/logout' => 'oauth#logout'
  # get 'auth/failure' => 'oauth#failure'
  # get 'auth/:provider/callback' => 'oauth#callback'

  # routes for main app
  # get 'workout/all' => 'workout#all'
  # get 'workout/new' => 'workout#new'  
  # post 'workout/new' => 'workout#create'

  


  # get 'workout/:id' => 'workout#show'
  # post 'workout/:id' => 'workout#time'

  # get '/signin' => 'sessions#new'
  # post '/signin' => 'sessions#create'
  # get '/signout' => 'sessions#destroy'

  # get '/users/new' => 'user#new'
  # post '/users/new' => 'user#create'


  # get '/gyms/nearme' => 'workout#nearme'
  # post '/gyms/nearme' => 'workout#getgyms'
  # get '/stats' => 'workout#stats'

# API ENDPOINTS

  get '/api' => 'main#api'

  get '/api/stats/:name' => 'workoutapi#stats_data'
  post '/api/stats' => 'workoutapi#user_stats'

  get '/api/workout' => 'workoutapi#all'
  post '/api/workout' => 'workoutapi#create'

  post '/api/gyms/nearme' => 'workoutapi#getgyms'

  get '/api/workout/:id' => 'workoutapi#show'
  post '/api/workout/:id' => 'workoutapi#time'
  
  post '/api/nearme' => 'workoutapi#nearme'

  post '/api/users/create' => 'userapi#create'

  resources :user
  # get 'workout/create'

  # get 'workout/view'

  # get 'workout/stats'

  # get 'workout/nearme'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    # resources :workout
    # resources :user

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
