ActiveAdmin.register Project do
  menu :priority => 4

  form do |f|
    f.inputs :User do
      f.input :subdomain
      f.input :title
      f.input :template_id, as: :select, :collection => Template.all
      f.input :color_scheme_id, as: :select, :collection => ColorScheme.all
      f.input :background_id, as: :select, :collection => Background.all
      f.input :logo, as: :file
    end
    f.buttons
  end

end
