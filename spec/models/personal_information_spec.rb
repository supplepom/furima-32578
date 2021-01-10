require 'rails_helper'

RSpec.describe PersonalInformation, type: :model do
  describe '購入情報の保存' do
    before do
      @personal_information = FactoryBot.build(:personal_information)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@personal_information).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @personal_information.postal_code = nil
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @personal_information.postal_code = '1234567'
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'address_idを選択していないと保存できないこと' do
      @personal_information.address_id = 1
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Address must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @personal_information.city = nil
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("City can't be blank")
    end
    it 'cityは全角文字以外では保存できないこと' do
      @personal_information.city = 'hoge123'
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("City is invalid. Input full-width characters.")
    end
    it 'house_numberが空だと保存できないこと' do
      @personal_information.house_number = nil
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("House number can't be blank")
    end
    it 'house_numberは全角文字以外では保存できないこと' do
      @personal_information.house_number = 'hoge123'
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("House number is invalid. Input full-width characters.")
    end
    it 'buildingは空でも保存できること' do
      @personal_information.building = nil
      expect(@personal_information).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @personal_information.phone_number = nil
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは半角数字以外では保存できないこと' do
      @personal_information.phone_number = 'ほげhoge'
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    it 'phone_numberは半角数字以外では保存できないこと' do
      @personal_information.phone_number = 'ほげhoge'
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    it 'phone_numberは12桁以上では保存できないこと' do
      @personal_information.phone_number = '012345678901'
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Phone number is invalid. Input less than 11 numbers.")
    end
    it "tokenが空では登録できないこと" do
      @personal_information.token = nil
      @personal_information.valid?
      expect(@personal_information.errors.full_messages).to include("Token can't be blank")
    end
  end
end
