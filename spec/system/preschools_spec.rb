require 'rails_helper'

RSpec.describe "Preschools", type: :system do
  before do
    @preschool = FactoryBot.create(:preschool)
    @admin = FactoryBot.create(:admin)
  end
  context '保育園情報投稿ができるとき'do
  it 'ログインした管理者は新規投稿できる' do
    # トップページに移動する
    visit root_path
    # トップページにログインページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    # ログインする
    visit new_admin_session_path
    fill_in 'メールアドレス', with: @admin.email
    fill_in 'パスワード', with: @admin.password
    click_button 'ログイン'
    expect(current_path).to eq root_path
    # 新規投稿ページへのリンクがあることを確認する
    expect(page).to have_content('新規投稿')
    # 投稿ページに移動する
    visit new_preschool_path
    # フォームに情報を入力する
    # fill_in 'images', with: @preschool.images
    fill_in '保育園名', with: @preschool.name
    fill_in '郵便番号', with: @preschool.post_number
    fill_in 'エリア', with: @preschool.area_id
    fill_in '所在地', with: @preschool.address
    fill_in '建物名', with: @preschool.building
    fill_in '電話番号', with: @preschool.phone_number
    fill_in 'アクセス', with: @preschool.access
    fill_in '開園時間', with: @preschool.open_hour
    fill_in '開園時間', with: @preschool.close_hour
    fill_in '定員数', with: @preschool.capacity
    fill_in '運営業態', with: @preschool.category.id
    fill_in 'メールアドレス', with: @preschool.email
    fill_in '園の特徴', with: @preschool.concept
    # 送信するとPreschoolモデルのカウントが1上がることを確認する
    expect{
      find('input[name="投稿する"]').click
    }.to change { Preschool.count }.by(1)
    # 投稿完了ページに遷移することを確認する
    expect(current_path).to eq preschools_path
    # 「投稿が完了しました」の文字があることを確認する
    expect(page).to have_content('投稿が完了しました。')
    # トップページに遷移する
    visit root_path
    # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
    expect(page).to have_selector ".content_post[style='background-image: url(#{@preschool.image});']"
    # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
    expect(page).to have_content(@preschool_text)
  end
end
  context '保育園情報投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      # 新規投稿ページへのリンクがない
    end
  end
end
