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
    @module = @project.page_modules.find_by_slug(params[:page_id])
    Album.find(params[:album_id]).photos.create!(params[:photo])
    redirect_to album_path(page_id: @module.slug, id: params[:album_id])
  end

end
