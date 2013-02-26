class PageModulesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :template_variables_load, only: :show
  layout :load_template
  def create
    new_page = params[:page_modules][:module_type].constantize.create slug: params[:page_modules][:slug], anchor: params[:page_modules][:anchor], project_id: current_user.project.id
    redirect_to page_module_url(id: new_page.slug, host: with_subdomain(current_user.project.subdomain))
  end

  def show
    @module = @project.page_modules.find_by_slug(params[:id])
    @page = (@module.type + 'Attr').constantize
    @page = @page.where((@module.type.underscore + '_id').to_sym => @module.id).first
    render 'page_modules/' + @module.type.underscore + '.html.slim'
  end
end
