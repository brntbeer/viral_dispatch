ViralDispatch::Application.routes.draw do
  resources :comments

  resources :posts
  root :to => "posts#index"

  scope "auth" do
    get "/:login_type/callback", :to => "users#callback", :as => :login
    get "/logout", :to => "users#logout", :as => :logout
  end
end
