class StaticPagesController < ApplicationController

  before_filter :authenticate_user!

  def update
    @update_static_page = StaticPage.find(params[:static_page_attr][:static_page_id]).static_page_attr
    if @update_static_page.present?
      if @update_static_page.update_attributes content: params[:static_page_attr][:content]
        #flash[:notice] = t(:update_static_page_updated)
        # TODO : Не просто текст, а норм ответ
        render text: 'Everything ok!'
      else
        #flash[:error] = t(:update_static_page_not_updated)
        render text: 'Everything bad!'
      end
      #redirect_to page_module_url(page_id: @update_static_page.static_page.slug, host: with_subdomain(current_user.project.subdomain))
    else
      create
    end
  end

  def create
    @new_static_page = StaticPage.find(params[:static_page_attr][:static_page_id]).build_static_page_attr content: params[:static_page_attr][:content]
    if @new_static_page.save
      flash[:notice] = t(:new_static_page_created)
    else
      flash[:error] = t(:new_static_page_not_created)
    end
    #redirect_to page_module_url(page_id: @new_static_page.static_page.slug, host: with_subdomain(current_user.project.subdomain))
  end
end
