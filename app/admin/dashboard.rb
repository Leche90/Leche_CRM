# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Customers" do
          ul do
            Customer.last(5).map do |customer|
              li link_to(customer.full_name, admin_customer_path(customer))
            end
          end
        end
      end

      column do
        panel "Admin Information" do
          para "Welcome to the Leche CRM Admin Dashboard."
          para "Manage your customers, admin users, and other resources efficiently."
        end
      end
    end

  end # content
end
