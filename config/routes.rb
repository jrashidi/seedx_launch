Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :signup_queues
  root 'signup_queues#new'

  get 'signup_queues/confirm_email/:ref', to: 'signup_queues#confirm_email'
end
