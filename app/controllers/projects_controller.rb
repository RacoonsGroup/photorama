class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => :show
  before_filter :template_variables_load, only: :show
  layout :load_template

  def show
    unless @project
      redirect_to root_url
    end
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
    redirect_to root_url(:host => with_subdomain(@project.subdomain))
  end

  def change_style
    @project = Project.where(subdomain:request.subdomain).first
    @project.update_attributes(params[:project])
    if @project.save
      redirect_to root_url(:host => with_subdomain(@project.subdomain))
    end
  end
end
