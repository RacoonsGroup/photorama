PhotoRama::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users
  resources :projects

  constraints(Subdomain) do
    match '/' => 'projects#show'
    get '/add_item_to_menu' => 'projects#add_item_to_menu'
    put '/change_style' => 'projects#change_style'
    get '/render_block_tpl' => 'projects#render_block_tpl'
    get '/render_block_control' => 'projects#render_block_control'
    put '/change_logo' => 'projects#change_logo', as: :change_logo

    constraints :page_id => /([a-z0-9\-\_]{3,})/ do
      get ":page_id" => "page_modules#show", as: :page_module
      scope ":page_id" do
        resources :albums do
          resources :photos
        end
      end
      resources :page_modules


      post 'page_modules/menu_update_order' => 'page_modules#menu_update_order', as: :menu_update
      post 'page_modules/delete_page' => 'page_modules#delete_page', as: :delete_page
      post 'page_modules/retrieve_page' => 'page_modules#retrieve_page', as: :retrieve_page
      post 'page_modules/update_page' => 'page_modules#update_page', as: :update_page

    end

    resources :static_pages
    resources :main_pages, only: [:update, :create]
  end
  root to: 'welcome#index'

end
