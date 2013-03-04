class PageModulesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :template_variables_load, only: :show
  layout :load_template
  respond_to :js, only: [:menu_update, :delete_page, :retrieve_page]

  def create
    new_page = params[:page_modules][:module_type].constantize.new(slug: params[:page_modules][:slug], anchor: params[:page_modules][:anchor], project_id: current_user.project.id)

    if new_page.save
      if params[:page_modules][:module_type] == 'Gallery'
        GalleryAttr.create(:gallery_id => Gallery.last.id)
      end
      redirect_to page_module_url(id: new_page.slug, host: with_subdomain(current_user.project.subdomain))
    else
      flash[:error] = t(:new_page_not_created)
      redirect_to root_url(host: with_subdomain(current_user.project.subdomain))
    end
  end

  def delete_page
    unless PageModule.find(params[:page_modules][:id]).update_attributes(deleted: true, deleted_at: Time.now)
      flash[:error] = t(:page_not_deleted)
    end
  end

  def retrieve_page
    unless PageModule.find(params[:page_modules][:id]).update_attributes(deleted: false)
      flash[:error] = t(:page_not_retrieved)
    end
  end

  def update_page
    PageModule.find(params[:page_modules][:id]).update_attributes(params[:page_modules].delete_if{|key, value| value.blank? })
  end

  def menu_update
    unless PageModule.update(params[:menu_order].keys, params[:menu_order].values)
      flash[:error] = t(:page_order_not_updated)
    end
  end

  def show
    @module = @project.page_modules.find_by_slug(params[:id])
    @page = (@module.type + 'Attr').constantize
    @page = @page.where((@module.type.underscore + '_id').to_sym => @module.id).first
    render 'page_modules/' + @module.type.underscore + '.html.slim'
  end
end
