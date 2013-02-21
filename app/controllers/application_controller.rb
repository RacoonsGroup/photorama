class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  def after_sign_in_path_for(resource)
    new_project_path
  end

  private

    def users_layout
      'default'
    end
end
