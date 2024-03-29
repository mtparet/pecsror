Pecs::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  
  match "/images/new" => "image#new", :as => :image
  get "/images" => "image#index"
  post "/images" => "image#create"
  #match "/images/create" => "image#create"
  match "/images_sequentielles" => "image_sequentielle#index"
  match "/images_sequentielles/display_sequence" => "image_sequentielle#display_sequence"
  match "/images_sequentielles/new" => "image_sequentielle#new"
  match "/images_sequentielles/create_audio" => "image_sequentielle#create_audio"

  match "/images_sequentielles/edit" => "image_sequentielle#edit"
  match "/images_sequentielles/display_sequence_edit" => "image_sequentielle#display_sequence_edit"
  post "/images_sequentielles/save" => "image_sequentielle#save"

  post "/images_sequentielles/create" => "image_sequentielle#create"

  #resources :image

	match "/create_audio" => "affichage#create_audio"
	match "/create_phrase" => "affichage#create_phrase"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
