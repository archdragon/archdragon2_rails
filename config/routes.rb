Rails.application.routes.draw do
  resources :dragons do
    member do
      post 'feed'
    end
  end
end
