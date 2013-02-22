class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  def after_sign_in_path_for(resource)
    if current_path == new_admin_user_session
      admin_root
    else
      new_project_path
    end
  end

  private

    def users_layout
      'default'
    end
end
