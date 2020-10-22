class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :days_id
    validates :price
    validates :image
  end
  validates :category_id, numericality: { other_than: 1 }
end
