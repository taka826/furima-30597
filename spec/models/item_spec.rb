require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('test.png')
  end

  context '新規登録がうまく行く時' do
    it "全ての項目が存在すれば登録ができること" do
      expect(@item).to be_valid
    end
  end

  context '出品できない場合' do
    it "商品画像がない場合は保存できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名がない場合は保存できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品説明がない場合は保存できないこと" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "カテゴリー選択がない場合は保存できないこと" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態選択がない場合は保存できないこと" do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "配送料選択がない場合は保存できないこと" do
      @item.cost_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost must be other than 1")
    end
    it "発送元選択がない場合は保存できないこと" do
      @item.area_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")
    end
    it "発送日選択がない場合は保存できないこと" do
      @item.day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end
    it "金額記入がない場合は保存できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "金額が300以下の場合は保存できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of Range")
    end
    it "金額が9,999,999以上の場合は保存できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of Range")
    end
  end
end