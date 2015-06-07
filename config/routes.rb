Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'
  get '/welcome/index2', controller: 'welcome', action: 'index2'

  resource :session

  resources :dragons do
    member do
      post 'feed'
    end
  end
end
