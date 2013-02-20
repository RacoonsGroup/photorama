PhotoRama::Application.routes.draw do
  devise_for :users

  root to: 'welcome#index'
  constraints(Subdomain) do
    match '/' => 'projects#show'
  end
end
