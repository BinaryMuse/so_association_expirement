Associations::Application.routes.draw do
  resources :users do
    resources :conversations, :controller => "user_conversations"
    member do
      post :signin
    end
    collection do
      post :signout
    end
  end

  resources :conversations, :controller => "user_conversations" do
    resources :messages
    member do
      post :mark_as_read
      post :mark_as_unread
    end
  end

  root :to => "users#index"
end
