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
          expect(@preschool.errors.full_messages).to include("Nameを入力してください")
        end
        it '郵便番号が空だと登録できない' do
          @preschool.post_number = nil
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("Post numberは不正な値です", "Post numberを入力してください")
        end
        it '郵便番号が空だと登録できない' do
          @preschool.post_number = "1234567"
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("Post numberは不正な値です")
        end
        it 'エリアを選択しないと登録できない' do
          @preschool.area_id = nil
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("Areaは1以外の値にしてください")
        end
        it '住所が空と登録できない' do
          @preschool.street_number = nil
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("Street numberを入力してください")
        end
        it '電話番号が空と登録できない' do
          @preschool.phone_number = nil
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("Phone numberは不正な値です", "Phone numberを入力してください")
        end
        it '電話番号にハイフンが入っていると登録できない' do
          @preschool.phone_number = "090-1234-5678"
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("Phone numberは不正な値です", "Phone numberは11文字以内で入力してください")
        end
        it '電話番号が12桁以上だと登録できない' do
          @preschool.phone_number = "090012345678"
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("Phone numberは11文字以内で入力してください")
        end
        it '最寄り駅情報が空だと登録できない' do
          @preschool.access = nil
          @preschool.valid?
          expect(@preschool.errors.full_messages).to include("accessを入力してください")
        end
      end
    end
end
