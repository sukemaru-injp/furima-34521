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
  
  validates :name, :content, presence:true
  validates :image, presence: true
  # 価格の設定は後ほど
  validates :price, presence:true, inclusion: { in: 300..9999999 }

# アクティブハッシュバリデーション
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
end
