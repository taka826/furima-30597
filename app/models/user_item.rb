class UserItem
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :phone, :build_name, :order_id
 #addressから切り取ったバリデーション
  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :city
    validates :house_number
    validates :phone
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, phone: phone, build_name: build_name, order_id: order.id)
  end
end