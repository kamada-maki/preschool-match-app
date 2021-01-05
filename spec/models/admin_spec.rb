require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin = FactoryBot.build(:admin)
  end
  describe '会員登録' do
    context '登録がうまくいくとき' do
      it '正しく情報を入力すれば登録できる' do
        expect(@admin).to be_valid
      end
    end
    context '登録が上手くいかないとき' do
      it 'nameが空だと登録できない' do
        @admin.name = nil
        @admin.valid?
        expect(@admin.errors.full_messages).to include('運営者名を入力してください')
      end
      it 'emailが空だと登録できない' do
        @admin.email = nil
        @admin.valid?
        expect(@admin.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailがに＠が含まれないと登録できない' do
        @admin.email = 'test.test'
        @admin.valid?
        expect(@admin.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @admin.password = nil
        @admin.valid?
        expect(@admin.errors.full_messages).to include('パスワードを入力してください', 'パスワードは不正な値です', 'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが6文字以上でないと登録できない' do
        @admin.password = 'aaa12'
        @admin.valid?
        expect(@admin.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは6文字以上で入力してください', 'パスワードは不正な値です')
      end
      it 'passwordが英字のみだと登録できない' do
        @admin.password = 'abcdef'
        @admin.valid?
        expect(@admin.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは不正な値です')
      end
      it 'passwordが数字のみだと登録できない' do
        @admin.password = '123456'
        @admin.valid?
        expect(@admin.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは不正な値です')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @admin.password = 'abc123'
        @admin.password_confirmation = 'abc124'
        @admin.valid?
        expect(@admin.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end
