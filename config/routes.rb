Rails.application.routes.draw do
 

  #get 'requirements/new'

  devise_for :admins

  
  devise_for :users,:controllers => {:registrations => 'users'}

  resources :uploads

  resources :properties


#  devise_for :users
  resources :home do
    collection do
      get :home1
      get :land
      get :land1
      get :land2
      get :about_us
      get :aboutus_mobile
      get :services_mobile 
      get :cities_result
      get :contactus_mobile
      get :mobile_states
      get :privacy_policy
      get :help
      get :details_page
      get :cities_tn
      get :cities_ap
       get :cities_ka
      get :location_search
      get :main_home
      get :jointventure
      match :requirement, via: [:get, :post]
      
     
    end
    
    member do
      get :gallery
      get :image_slide
      get :map_options
    end
  end

  resources :contact
  resources :chat
  resources :contactus
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#main_home'

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
