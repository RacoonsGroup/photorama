# encoding=utf-8
class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => :show
  before_filter :template_variables_load, only: :show
  layout :load_template

  def show
      @module = @project.page_modules.find_by_slug(params[:id])
      @page = MainPageAttr.find_by_main_page_id(@module.id)
      render template: 'page_modules/main_page.html.slim'
  end

  def new
    if current_user.project
      redirect_to root_url(:host => with_subdomain(current_user.project.subdomain))
    else
      render :layout => 'application'
    end
  end

  def create
    @project = current_user.build_project(params[:project])
    @project.save
    @mainpage = MainPage.new(slug: 'main', anchor: 'Главная', project_id: @project.id)
    @mainpage.save
    redirect_to root_url(:host => with_subdomain(@project.subdomain))
  end

  def change_style
    @project = Project.where(subdomain:request.subdomain).first
    @project.update_attributes(params[:project])
    if @project.save
      redirect_to root_url(:host => with_subdomain(@project.subdomain))
    end
  end

  def add_item_to_menu
    render partial: 'partial/control_panel/control/add_item_to_menu_form'
  end

  def render_block_tpl
    @number_of_columns = params[:columns]
    render partial: 'partial/blocks/block'
  end
end
