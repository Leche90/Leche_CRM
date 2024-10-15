ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :province, :notes, :image

  # Form Configuration
  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email, required: false # Mark email as not required in form
      f.input :province
      f.input :notes
      f.input :image, as: :file # Enables file upload for image
    end
    f.actions
  end

  # Show Page Configuration
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :province
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), size: "225x300" # Preferred image size
        else
          "No Image Uploaded"
        end
      end
    end
    active_admin_comments
  end

  # Index Page Configuration
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :province
    column :created_at
    column :updated_at
    actions
  end

  # Filters Configuration
  filter :full_name
  filter :email
  filter :province
  filter :phone_number
  filter :created_at
end
