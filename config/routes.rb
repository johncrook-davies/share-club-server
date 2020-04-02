Rails.application.routes.draw do
    
    resources :stocks, only: [:show]
    
end
