#<<<<<<< HEAD
MadisonStudentApartmentFinder::Application.routes.draw do
  resources :lists
  
  #<%= link_to '[About Us]', about_path %>
  match '/about' 		=>	'home#about',	:as => :about
  match '/home_page'	=>	'home#index',	:action => 'GET'
  match '/new_listing' 	=>	'lists#new',	:action => 'GET'


  #Tried to get our own routes set up with what was done.  If you uncomment, then you can see the issues at /listings
  #match '/listings' =>           'lists#index',      :action => 'GET',     :as => :lists
  #match '/listings/:id' =>       'lists#show',       :action => 'GET',     :as => :listing_show
  #match '/listings/:id/edit' =>  'lists#edit',       :action => 'GET',     :as => :listing_edit
  #match '/listings/:id' =>       'lists#destroy',    :action => 'DESTROY', :as => :listing_delete
  #match '/listings/new' =>       'lists#new',        :action => 'GET',     :as => :listing_create
  
  #If you are going to test the above, some URLs in the files will have to change (shown below): 
  # <%= link_to 'Edit', listing_edit_path(@list) %> |
  # <%= link_to 'Back', lists_path %>    (at bottom of show.html.erb)
  # <td><%= link_to 'Show', listing_show_path(list) %></td>
  #  <td><%= link_to 'Edit', listing_edit_path(list) %></td>
  #  <td><%= link_to 'Destroy', listing_delete_path(list), :confirm => 'Are you sure?', :method => :delete %></td>
  # (Towards the bottom of index.html.erb)

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
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

