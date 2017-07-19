Rails.application.routes.draw do
  get 'signup_queues/index'

  get 'signup_queues/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :signup_queues
end
