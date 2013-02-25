class PageModulesController < ApplicationController
  def create
    new_page = params[:page_modules][:module_type].constantize.create slug: params[:page_modules][:slug], anchor: params[:page_modules][:anchor], project_id: current_user.project.id
    redirect_to page_module_url(id: new_page.slug, host: with_subdomain(current_user.project.subdomain))
  end

  def show
  end
end
