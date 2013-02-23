class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  def after_sign_in_path_for(resource)
    if url_for(:only_path=>true) == new_admin_user_session_path
      admin_root_path
    else
      new_project_path
    end
  end

  def load_template
    project = Project.where(subdomain:request.subdomain).first
    if project.template
      project.template.layout_name
    else
      'default'
    end
  end

  private

    def users_layout
      'default'
    end
end
