Rails.application.routes.draw do
<<<<<<< Updated upstream
  root 'welcome#index'
=======
  devise_for :users

  root to: 'welcome#index'

  resources :dragons do
    member do
      post 'feed'
    end
  end
>>>>>>> Stashed changes
end
