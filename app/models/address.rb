class Address < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :city
    validates :house_number
    validates :phone
  end
  
  validates :build_name
end
