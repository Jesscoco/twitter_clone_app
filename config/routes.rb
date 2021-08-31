Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    collection do
      get :list
      post :confirm
    end
  end
end
