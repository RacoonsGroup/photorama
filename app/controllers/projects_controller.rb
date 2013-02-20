class ProjectsController < ApplicationController
  def show
    if params[:slug].blank?
      redirect_to root_url
    end
    @project = Project.find(params[:slug])
  end
end
