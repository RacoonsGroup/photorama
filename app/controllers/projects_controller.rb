class ProjectsController < ApplicationController

  before_filter :authenticate_user!, except: :show
  layout 'default'

  def show
    @project = Project.where(subdomain:request.subdomain)
    unless @project
      redirect_to root_url
    end

  end

  def new
    if current_user.project
      redirect_to root_url(:host => with_subdomain(current_user.project.subdomain))
    end
  end

  def create
    @project = current_user.build_project(params[:project])
    @project.save
    redirect_to root_url(:host => with_subdomain(@project.subdomain))
  end
end
