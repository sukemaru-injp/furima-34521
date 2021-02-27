class GetAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_name, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address_name
    validates :phone_number, length: { maximum: 11 }, format: {with: /\A[0-9]+\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    get = Get.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_name: address_name, building_name: building_name, phone_number: phone_number, get_id: get.id)
  end
end