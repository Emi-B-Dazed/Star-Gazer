Rails.application.routes.draw do
  resources :favorites
  devise_for :users
  root "events#index"
  resources :events do
    resources :favorites, only: [:create, :destroy]
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :locations
  
end
