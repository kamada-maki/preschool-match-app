require 'rails_helper'

RSpec.describe Preschool, type: :model do
    before do
      @preschool = FactoryBot.build(:preschool)
    end
    describe '保育園情報の登録' do
      context  '登録がうまくいくとき' do
        it '正しく情報を入力すれば登録できる' do
          expect(@preschool).to be_valid
        end
        it '建物名は空でも登録できる' do
          @preschool.building = nil
          expect(@preschool).to be_valid
        end
      end
      context  '登録がうまくいかないとき' do
        it '名前が空だと登録できない' do
          @preschool.name = nil
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '郵便番号が空だと登録できない' do
          @preschool.post_number = nil
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '郵便番号が空だと登録できない' do
          @preschool.post_number = "1234567"
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it 'エリアを選択しないと登録できない' do
          @preschool.area_id = 1
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '住所が空と登録できない' do
          @preschool.street_number = 1
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '電話番号が空と登録できない' do
          @preschool.phone_number = nil
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '電話番号にハイフンが入っていると登録できない' do
          @preschool.phone_number = "090-1234-5678"
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '電話番号にハイフンが入っていると登録できない' do
          @preschool.phone_number = "090-1234-5678"
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '電話番号が12桁以上だと登録できない' do
          @preschool.phone_number = "0900-1234-5678"
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '最寄り駅情報が空だと登録できない' do
          @preschool.station = nil
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
        it '最寄り駅情報が空だと登録できない' do
          @preschool.station = nil
          @preschool.valid?
          expect(@preschool.eroors.full_messages).to include("")
        end
      end
    end
end
