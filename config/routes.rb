Rails.application.routes.draw do
    
    mount ActionCable.server => '/cable'
    resources :stocks, only: [:show, :index]
    resources :exchanges, only: [:show, :index]
    
end
