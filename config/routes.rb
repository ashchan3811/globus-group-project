Rails.application.routes.draw do
  
  root "home#index"
  
  get 'admin' , to: 'admin#index' , as: 'admin'
  get 'search' , to: 'home#search'
  
  get 'admin_login' , to: 'home#admin_login'
  post 'admin_login' , to: 'home#admin_signin'
  
  get 'faculty_login' , to: 'home#faculty_login'
  post 'faculty_login' , to: 'home#faculty_signin'
  
  get 'student_login' , to: 'home#student_login'
  post 'student_login' , to: 'home#student_signin'
  
  get 'admin_logout' , to: 'home#admin_logout'
  
  get 'faculty_logout' , to: 'home#faculty_logout'
  
  get 'student_logout' , to: 'home#student_logout'
  
  get 'student/:id/change_password' , to: 'students#change_password' , as: 'student_change_password'
  post 'student/:id/change_password' , to: 'students#update_password'
  
  get 'admin/faculties' , to: 'admin#faculties' , as: 'list_faculty'
  get 'admin/students' , to: 'admin#students' , as: 'list_students'
  
  get 'faculty/:id/home' , to: 'faculties#index' , as: 'home_faculty'
  
  resources :admin, only: [:show,:edit,:update]
  resources :students
  resources :faculties
  resources :subjects
  resources :fee_receipts
  
  get 'students/:id/results/:semester_id' , to: 'students#result', as: 'show_result'
end
