Rails.application.routes.draw do
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :index, :show]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
