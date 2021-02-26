class Item < ApplicationRecord
# アクティブハッシュアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_ship


  belongs_to :user
  has_one_attached :image
  has_one :get
  
  with_options presence: true do
    validates :name
    validates :content
    validates :image
    validates :price, inclusion: { in: 300..9999999 }
  end
# アクティブハッシュバリデーション
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
