class PhotosController < ApplicationController

  before_filter :template_variables_load
  layout :load_template

  def index
    @album = Album.find(params[:album_id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @module = @project.page_modules.find(params[:page_module_id])
    Album.find(params[:album_id]).photos.create!(params[:photo])
    redirect_to page_module_album_path(page_module_id: @module.slug, id: params[:album_id])
  end

end
