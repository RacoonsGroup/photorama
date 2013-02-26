class MainPagesController < ApplicationController

  before_filter :authenticate_user!

  def update
    @create_main_page = MainPage.find(params[:main_page_attr][:main_page_id]).main_page_attr
    if @create_main_page.update_attributes  content: params[:main_page_attr][:content], gallery_toggle: params[:main_page_attr][:gallery_toggle]
      flash[:notice] = t(:main_page_create)
    else
      flash[:error] = t(:main_page_not_create)
    end
    redirect_to root_url(host: with_subdomain(current_user.project.subdomain))
  end

  def create
    @create_main_page = MainPage.find(params[:main_page_attr][:main_page_id]).build_main_page_attr content: params[:main_page_attr][:content], gallery_toggle: params[:main_page_attr][:gallery_toggle]
    if @create_main_page.save
      flash[:notice] = t(:main_page_create)
    else
      flash[:error] = t(:main_page_not_create)
    end
    redirect_to root_url(host: with_subdomain(current_user.project.subdomain))
  end
end
