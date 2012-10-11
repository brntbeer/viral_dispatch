ViralDispatch::Application.routes.draw do
  resources :comments

  resources :posts
  root :to => "posts#index"

  scope "auth" do
    get "/:login_type/callback", :to => "users#callback"
  end
end
