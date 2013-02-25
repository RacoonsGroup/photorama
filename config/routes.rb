PhotoRama::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users
  resources :projects

  constraints(Subdomain) do
    match '/' => 'projects#show'
    resources :page_modules
  end
  root to: 'welcome#index'

  put '/change_style' => 'projects#change_style'
end
