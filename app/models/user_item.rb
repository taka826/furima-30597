class UserItem
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :phone, :build_name, :order_id
 #addressから切り取ったバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Postal code is invalid. Include hyphen(-)"}
    validates :area_id
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A[0-9]{3}[0-9]{4}[0-9]{4}\z/, message: "Phone number is invalid. Include hyphen(-)"}
  end

  validates :area_id, numericality: { other_than: 0 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, phone: phone, build_name: build_name, order_id: order.id)
  end
end