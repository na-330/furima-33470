require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe "商品購入情報の保存" do
    context "購入情報が保存できるとき" do
      
      it "token, postal_code, city, house_number, building, prefecture_id, phone_number, item_id, user_idの値が存在する" do
        expect(@purchase).to be_valid
      end

      it "bulidingが空のとき" do
        @purchase.building = nil
        expect(@purchase).to be_valid
      end
    end

    context "購入情報が保存できないとき" do
      
      it "tokenが空の時" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空の時" do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it "cityが空の時" do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it "housenumberが空の時" do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end

      it "phone_numberが空の時" do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it "prefecture_idが空の時" do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture is not a number")
      end

      it "prefecture_idのidが0のとき" do
        @purchase.prefecture_id = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it "postal_codeのハイフンがない時" do
        @purchase.postal_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it "phone_numberにハイフンつける時" do
        @purchase.phone_number = "111-2222-3333"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is not a number")
      end

      it "phone_numberが11字未満のとき" do
        @purchase.phone_number = 1234567
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
    end
  end
end