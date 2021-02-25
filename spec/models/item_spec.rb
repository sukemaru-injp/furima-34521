require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context '保存できる' do
      it "全項目入力で登録できる" do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "contentが空では登録できない" do
        @item.content = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it "categoryが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "conditionが空では登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end

      it "delivery_feeが空では登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end

      it "prefectureが空では登録できない" do
        @item.prefecture_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it "days_to_shipが空では登録できない" do
        @item.days_to_ship_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end

      it "priceが空では登録できない" do
        @item.price  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list")
      end

      it "priceが300以下では登録できない" do
        @item.price  = 2
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが9999999以上では登録できない" do
        @item.price  = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが全角では登録できない" do
        @item.price  = "８０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      
    end
  end
end
