require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '寄付情報の保存' do
    before do
      @user_item = FactoryBot.build(:user_item)
    end

    context '新規登録がうまく行く時' do
      it "全ての項目が存在すれば登録ができること" do
        expect(@user_item).to be_valid
      end
      it 'building_nameだけは空でも保存できること' do
        @user_item.build_name = nil
        expect(@user_item).to be_valid
      end
    end

    context '新規登録がうまく行かない時' do
      it 'postal_codeが空だと保存できないこと' do
        @user_item.postal_code = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_item.postal_code = '1234567'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code Postal code is invalid. Include hyphen(-)")
      end
      it 'areaを選択していないと保存できないこと' do
        @user_item.area_id = 0
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Area must be other than 0")
      end
      it 'cityは空だと保存できないこと' do
        @user_item.city = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberは空だと保存できない事' do
        @user_item.house_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @user_item.phone = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが半角のハイフン含む形式だと保存できないこと' do
        @user_item.phone = '080-1234567'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone Phone number is invalid. Include hyphen(-)")
      end
      it 'tokenが空では登録できないこと' do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end