AwsFederationPortal::Application.routes.draw do
  root 'aws_accounts#index'
  post '/', to: 'aws_accounts#login'
  
  resource :sessions, only: [:new, :create, :destroy]
end
