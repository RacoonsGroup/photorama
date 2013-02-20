PhotoRama::Application.routes.draw do
  devise_for :users

  root to: 'welcome#index'
  # constraints(Slug) do
  #   match '/' => 'projects#show'
  # end
end
