require 'rails_helper'

RSpec.describe GetAddress, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @get_address = FactoryBot.build(:get_address, user_id: user.id, item_id: item.id)
  end

  # 保存できる
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@get_address).to be_valid
  end

  it 'building_nameは空でも保存できること' do
    @get_address.building_name = ''
    expect(@get_address).to be_valid
  end

  # 保存できない

  it 'postal_codeが空だと保存できないこと' do
    @get_address.postal_code = ''
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @get_address.postal_code = '1234567'
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
  end

  it 'prefectureが1だと保存できないこと' do
    @get_address.prefecture_id = 1
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'cityが空だと保存できないこと' do
    @get_address.city = ""
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include("City can't be blank")
  end

  it 'address_nameが空だと保存できないこと' do
    @get_address.address_name = ''
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include("Address name can't be blank")
  end

  it 'phone_numberが空だと保存できないこと' do
    @get_address.phone_number = ''
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
  end

  it 'phone_numberが全角だと保存できないこと' do
    @get_address.phone_number = '０９０１２３４５６７８'
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include("Phone number is invalid")
  end

  it 'phone_numberが12文字以上だと保存できないこと' do
    @get_address.phone_number = '090123456789'
    @get_address.valid?
    expect(@get_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end

  it "tokenが空では登録できないこと" do
    @get_address.token = nil
    @get_address.valid?
    binding.pry
    expect(@get_address.errors.full_messages).to include("Token can't be blank")
  end

end
