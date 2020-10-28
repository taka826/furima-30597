class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  belongs_to :item
  belongs_to :user
  has_one :address
end
