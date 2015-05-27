Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root to: 'welcome#index'

  resources :dragons do
    member do
      post 'feed'
    end
  end
end
