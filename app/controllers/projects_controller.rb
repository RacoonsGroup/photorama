class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => :show
  layout 'default'

  def show
    @project = Project.where(subdomain:request.subdomain).first
    @templates = Template.all

    if current_user && current_user.project.subdomain == request.subdomain
      @admin_panel = true
    else
      @admin_panel = false
    end

    unless @project
      redirect_to root_url
    end

    if @project.template_id
      @templates.each do |template|
        if template.id == @project.template_id
          render :layout => template.layout_name
        end
      end
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

  def change_template
    @project = Project.where(subdomain:request.subdomain).first
    @project.update_attributes(params[:project])
    if @project.save
      redirect_to root_url(:host => with_subdomain(@project.subdomain))
    end
  end
end
