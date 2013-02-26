PhotoRama::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users
  resources :projects

  constraints(Subdomain) do
    match '/' => 'projects#show'
    resources :page_modules
    resources :static_pages
    resources :main_pages, only: [:update, :create]
  end
  root to: 'welcome#index'

  put '/change_style' => 'projects#change_style'
end
