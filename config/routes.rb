Rails.application.routes.draw do
  
  root "home#index"
  
  get 'admin' , to: 'admin#index'
  get 'search' , to: 'home#search'
  
  get 'admin_login' , to: 'home#admin_login'
  post 'admin_login' , to: 'home#admin_signin'
  
  get 'admin_logout' , to: 'home#admin_logout'
  
  resources :students

end
