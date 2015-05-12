Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :dragons do
    member do
      post 'feed'
    end
  end
end
