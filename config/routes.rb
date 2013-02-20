PhotoRama::Application.routes.draw do
  devise_for :users

  root to: 'welcome#index'
  match '/' => 'projects#show', :constraints => { :slug => /.+/ }
end
