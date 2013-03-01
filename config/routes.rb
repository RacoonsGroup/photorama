PhotoRama::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users
  resources :projects

  constraints(Subdomain) do
    match '/' => 'projects#show'
    resources :page_modules do
      resources :albums do
        resources :photos
      end
    end
    post 'page_modules/menu_update' => 'page_modules#menu_update', as: :menu_update
    post 'page_modules/delete_page' => 'page_modules#delete_page', as: :delete_page
    post 'page_modules/retrieve_page' => 'page_modules#retrieve_page', as: :retrieve_page
    post 'page_modules/update_page' => 'page_modules#update_page', as: :update_page
    resources :static_pages
    resources :main_pages, only: [:update, :create]
  end
  root to: 'welcome#index'

  put '/change_style' => 'projects#change_style'
  get '/add_item_to_menu' => 'projects#add_item_to_menu'
end
