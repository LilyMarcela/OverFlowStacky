Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'questions#index'
  resources :questions do
  	resources :comments, module: :questions
  	resources :votes, module: :questions
  	resources :answers do
  	  resources :comments, module: :answers
  	  resources :votes, module: :answers
  	end
  end
end
