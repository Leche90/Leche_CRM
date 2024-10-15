class AdminUser < ApplicationRecord
  # Devise modules (make sure all relevant modules are included)
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  # Ransack: Only allow searchable attributes that are necessary
  def self.ransackable_attributes(auth_object = nil)
    ["id", "email", "created_at", "updated_at"]
  end

  # Ransack: No associations allowed for searching
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
