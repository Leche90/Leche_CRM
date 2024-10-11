# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: "Leche CRM" do
    # Dashboard Header Section
    div class: "dashboard-header", style: "text-align: center;" do
      h1 "Welcome to the Admin Dashboard"
      p class: "dashboard-subheader", style: "font-size: 20px; margin-top: 10px; display: block;" do
        "Manage your customers, admin users, and other resources efficiently."
      end
    end

    # Customer Cards Section
    columns do
      column do
        panel "All Customers" do
          div class: "columns is-multiline" do
            Customer.last(6).each do |customer|
              div class: "column is-one-third", style: "padding: 10px;" do
                div style: "margin-bottom: 20px; border: 1px solid #ddd; padding: 10px; border-radius: 8px;" do
                  render partial: 'customers/customer', locals: { customer: customer }
                end
              end
            end
          end
        end
      end

      # Admin Information Section
      column do
        panel "Admin Information" do
          para "Use this section to view recent customer activity, manage resources, and perform administrative tasks."
          para "Ensure to regularly check and update customer information to maintain data accuracy."
        end
      end
    end
  end
end
