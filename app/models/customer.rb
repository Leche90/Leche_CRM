class Customer < ApplicationRecord
  # Associations
  has_one_attached :image # For ActiveStorage attachment

  # Validations
  validates :full_name, presence: true # Ensures the customer must provide a full name
  validate :valid_full_name # Custom validation for full name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true # Email is optional, but if provided, it must be valid
  validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers" } # Phone number must be provided and contain only digits
  validates :province, presence: true # Province must be provided

  # Scopes (Optional)
  scope :recent, -> { order(created_at: :desc) }

  # Ransack: Explicitly allow searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["id", "full_name", "email", "phone_number", "province", "created_at", "updated_at"]
  end

  # Ransack: Allow any associations
  def self.ransackable_associations(auth_object = nil)
    []
  end

  private

  # Custom validation for full name
  def valid_full_name
    # Check if the full name contains at least two words
    unless full_name.split.size >= 2
      errors.add(:full_name, "must include at least two names")
    end

    # Check if the full name only contains letters and spaces
    unless full_name.match?(/\A[a-zA-Z ]+\z/)
      errors.add(:full_name, "can only contain letters and spaces")
    end
  end
end
