require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context "商品が登録できる場合" do
      it "imageとtitle,description,category_id,condition_id,postage_id,address_id,preparation_day_id,priceがあれば投稿できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が登録できない場合" do
      it "imageが空では投稿できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end     
      it "titleが空では投稿できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end  
      it "descriptionが空では投稿できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end     
      it "category_idが空では投稿できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end  
      it "condition_idが空では投稿できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end       
      it "postage_idが空では投稿できない" do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage must be other than 1"
      end 
      it "preparation_day_idが空では投稿できない" do
        @item.preparation_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation day must be other than 1"
      end 
      it "priceが空では投稿できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end   
      it 'priceが全角文字では登録できない' do
        @item.price = 'ほげ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = 'hoge123'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it 'priceが半角英語だけでは登録できない' do
        @item.price = 'hoge'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it 'priceが¥299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it 'priceが¥10,000,000以上では登録できない' do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
    end
  end
end
