ActiveAdmin.register Template do
  form do |f|
    f.inputs :Templates do
      f.input :name
      f.input :layout_name
      f.input :thumbnail
    end
    f.buttons
  end

  show do |f|
    attributes_table do
      row :name
      row :layout_name
      row :thumbnail do
          image_tag(f.thumbnail.thumb.url)
      end
    end
    active_admin_comments
  end
end
