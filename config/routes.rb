PhotoRama::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users
  resources :projects

  constraints(Subdomain) do
    match '/' => 'projects#show'
  end
  root to: 'welcome#index'

  put '/change_template' => 'projects#change_template'
end
