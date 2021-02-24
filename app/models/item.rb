class Item < ApplicationRecord
# アクティブハッシュアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee


  belongs_to :user
  has_one_attached :image
  
  validates :name, :content, :price, presence:true

# アクティブハッシュバリデーション
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }

end
