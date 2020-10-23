class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :day_id
    validates :price
    validates :image
  end

  with_options numericality: {other_than: 1 } do
    validates :condition_id
    validates :category_id
    validates :cost_id
    validates :day_id
  end
  validates :area_id, numericality: { other_than: 0 }

  validates :price, numericality: { less_than_or_equal_to: 9999999, greater_than: 299 , message:"Out of Range" }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :day
end