PhotoRama::Application.routes.draw do
  devise_for :users
  resources :projects

  constraints(Subdomain) do
    match '/' => 'projects#show'
  end
  root to: 'welcome#index'
end
