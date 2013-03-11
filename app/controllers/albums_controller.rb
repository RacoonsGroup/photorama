class AlbumsController < ApplicationController
  before_filter :template_variables_load
  layout :load_template

  def create
    Gallery.where(:slug => params[:page_id]).first.gallery_attr.albums.create(params[:album])
    redirect_to page_module_path(params[:page_id])
  end

  def index
    @albums = Gallery.where(:slug => params[:page_id]).first.gallery_attr.albums
  end

  def show
    @module = @project.page_modules.find_by_slug(params[:page_id])
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

  def new
    @album = Album.new
  end

  def update
    album = Album.find(params[:id])
    if album.update_attributes(params[:album])
      flash[:notice] = 'Success'
      redirect_to album_path(page_id: album.gallery_attr.gallery.slug, id: album.id)
    end
  end


end