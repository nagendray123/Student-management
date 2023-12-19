Rails.application.routes.draw do
  # get 'welcomes/index'
  # root 'welcomes#index'
  root 'students#index'
 

  resources :students
end
