Rails.application.routes.draw do
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
  root 'home#main_home'
end
