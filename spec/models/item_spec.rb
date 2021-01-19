require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまく行くとき' do
        it '全ての項目を基準を満たして入力する' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまく行かないとき' do
        it "画像がないとき" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名が空では登録できない" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明が空では登録できない" do
          @item.info = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end
        it "カテゴリーの情報が空では登録できない" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "カテゴリーの情報が---では登録できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態の情報が空では登録できない" do
          @item.product_status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product status can't be blank")
        end
        it "商品の状態の情報が---では登録できない" do
          @item.product_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product status must be other than 1")
        end
        it "配送料の負担の情報が空では登録できない" do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it "配送料の負担の情報が---では登録できない" do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
        end
        it "発送元の地域の情報が空では登録できない" do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it "発送元の地域の情報が---では登録できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "発送までの日数の情報が空では登録できない" do
          @item.scheduled_delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end
        it "発送までの日数の情報が---では登録できない" do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
        end
        it "価格の情報が空では登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "価格が300以下では登録できない" do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "価格が9999999以上では登録できない" do
          @item.price = 99999999
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it "価格が半角数字以外では登録できない" do
          @item.price = '２２２２'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end