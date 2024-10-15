ActiveAdmin.register AdminUser do
  # Allowing only safe attributes for mass assignment in forms
  permit_params :email, :password, :password_confirmation

  # Filters for the index page: allowing only necessary fields to be searchable
  filter :email
  filter :created_at

  # Customizing the form view for AdminUser (remove unnecessary password validation if not updating password)
  form do |f|
    f.inputs "Admin User Details" do
      f.input :email

      # Only show password fields when creating or updating the password
      if f.object.new_record? || f.object.password.present?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

  # Customizing the display in the index page and show view
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
