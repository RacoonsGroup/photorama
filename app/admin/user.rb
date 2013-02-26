ActiveAdmin.register User do
  menu :priority => 3

  index do
    column :id
    column :email
    column :full_name
    column :project_subdomain do |user|
      if user.project
        link_to user.project.subdomain, admin_project_path(user.project)
      else
        t(:not_created)
      end
    end
    default_actions
  end

  form do |f|
    f.inputs :User do
      f.input :email
      f.input :full_name
      f.input :telephone
      f.input :city
    end
    f.buttons
  end
end
