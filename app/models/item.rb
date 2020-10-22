class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition
    validates :cost_id
    validates :area_id
    validates :days_id
    validates :price
    validates :image
  end
  validates :condition_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
end
