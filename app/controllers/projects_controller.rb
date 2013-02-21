class ProjectsController < ApplicationController

  before_filter :authenticate_user!, except: :show
  layout 'default'

  def show
    if current_user.project.subdomain == request.subdomain
      @admin_panel = true
    else
      @admin_panel = false
    end
    @project = Project.where(subdomain:request.subdomain).first
    unless @project
      redirect_to root_url
    end
    if (@project.template != nil)
      #Тут неплохо было бы еще въебать проверку на существование такого шаблона
      render :layout => @project.template
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
