class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :cost
    validates :area
    validates :day
    validates :price
    validates :image
  end
  validates :condition_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :cost_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 0 }
  validates :day_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :day
end
