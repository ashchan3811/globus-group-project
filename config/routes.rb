Rails.application.routes.draw do
  
  root "home#index"
  
  get 'admin/:id' , to: 'admin#index' , as: 'admin'
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
  
  get 'students/:id/change_password' , to: 'students#change_password' , as: 'student_change_password'
  post 'students/:id/change_password' , to: 'students#update_password'
  
  get 'admins/:id/change_password' , to: 'admin#change_password' , as: 'admin_change_password'
  post 'admins/:id/change_password' , to: 'admin#update_password'
  
  get 'faculties/:id/change_password' , to: 'faculties#change_password' , as: 'faculty_change_password'
  post 'faculties/:id/change_password' , to: 'faculties#update_password'
  
  get 'admins/:id/faculties' , to: 'admin#faculties' , as: 'list_faculty'
  get 'admins/:id/students' , to: 'admin#students' , as: 'list_students'
  
  get 'admins/:id/update_profile' , to: 'admin#edit' , as: 'update_admin_profile'
  post 'admins/:id/update_profile' , to: 'admin#update'
  
  get 'faculties/:id/home' , to: 'faculties#index' , as: 'home_faculty'
  get 'faculties/:id/students', to: 'faculties#students' , as: 'student_faculty'
  
  resources :admin, only: [:show,:edit,:update]
  resources :students
  resources :faculties
  resources :subjects
  resources :fee_receipts
  
  get 'students/:id/results/:semester_id' , to: 'students#result', as: 'show_result'
end
