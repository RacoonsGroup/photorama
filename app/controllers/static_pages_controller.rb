class StaticPagesController < ApplicationController

  before_filter :authenticate_user!

  def update
    @update_static_page = StaticPage.find(params[:static_page_attr][:static_page_id]).static_page_attr
    if @update_static_page.update_attributes content: params[:static_page_attr][:content]
      flash[:notice] = t(:update_static_page_updated)
    else
      flash[:error] = t(:update_static_page_not_updated)
    end
    redirect_to page_module_url(id: @update_static_page.static_page.slug, host: with_subdomain(current_user.project.subdomain))
  end

  def create
    @new_static_page = StaticPage.find(params[:static_page_attr][:static_page_id]).build_static_page_attr content: params[:static_page_attr][:content]
    if @new_static_page.save
      flash[:notice] = t(:new_static_page_created)
    else
      flash[:error] = t(:new_static_page_not_created)
    end
    redirect_to page_module_url(id: @new_static_page.static_page.slug, host: with_subdomain(current_user.project.subdomain))
  end
end
