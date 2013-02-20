class ProjectsController < ApplicationController

  before_filter :authenticate_user!, except: :show

  def show
    if params[:subdomain].blank?
      redirect_to root_url
    end
    @project = Project.find(params[:subdomain])
  end

  def new
  end

  def create
    @project = Project.new(params[:project])
    @project.save
  end
end
