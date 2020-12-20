require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '登録がうまくいく時' do
      it 'name, explaination, category_id, condition_id, fee_type_id, delivery_id, price, user_id, imageがあれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '登録できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image 必須項目です')
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Name 必須項目です')
      end

      it 'explainationが空では登録できない' do
        @item.explaination = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Explaination 必須項目です')
      end

      it 'category_id選択されていなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category 選択されていません')
      end

      it 'condition_id選択されていなければ登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition 選択されていません')
      end

      it 'fee_type_id選択されていなければ登録できない' do
        @item.fee_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee type 選択されていません')
      end

      it 'delivery_area_id選択されていなければ登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area 選択されていません')
      end

      it 'delivery_day_id選択されていなければ登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day 選択されていません')
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 必須項目です')
      end

      it 'priceは半角数字でないと登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字で入力してください')
      end
    end
  end
end
