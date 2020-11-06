Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  get '/chat', to: 'home#index'
  get '/get_current_user', to: 'home#get_current_user'
  get '/messages', to: 'home#messages'
  post '/messages', to: 'home#create_message'
  root 'home#index'
end
