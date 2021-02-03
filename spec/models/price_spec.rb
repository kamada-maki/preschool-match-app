require 'rails_helper'

RSpec.describe Price, type: :model do
  before do
    @price = FactoryBot.build(:price)
  end
  describe 'シュミレーション情報の登録' do
    context '登録がうまくいくとき' do
      it '正しく情報を入力すれば登録できる' do
        expect(@price).to be_valid
      end
    end
    context '登録がうまくいくいかないとき' do
      it '運営業態を選択していないと登録できない' do
        @price.category_id = nil
        @price.valid?
        expect(@price.errors.full_messages).to include('運営業態を入力してください')
      end
      it '年齢を選択していないと登録できない' do
        @price.age_id = nil
        @price.valid?
        expect(@price.errors.full_messages).to include('年齢を入力してください')
      end
      it '無償化対象金額を入力していないと登録できない' do
        @price.free_price = nil
        @price.valid?
        expect(@price.errors.full_messages).to include('保育料を入力してください')
      end
      it '無償化対象外金額を入力していないと登録できない' do
        @price.not_free_price = nil
        @price.valid?
        expect(@price.errors.full_messages).to include('保育料以外の金額を入力してください')
      end
    end
  end
end
