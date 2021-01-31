require 'rails_helper'

RSpec.describe "Preschools", type: :system, js: true do
  before do
    @preschool = FactoryBot.build(:preschool)
    @admin = FactoryBot.create(:admin)
  end
  context '保育園情報投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('新規投稿')
    end
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
    attach_file 'preschool-image', 'public/rspec-sample.png'
    fill_in 'preschool-name', with: @preschool.name
    fill_in 'preschool-postnumber', with: @preschool.post_number
    find('#preschool_area_id').find("option[value='#{@preschool.area_id}']").select_option
    # select '大阪市都島区', from: 'preschool_area_id' #ラベル指定であればこのような書き方もできる様です
    fill_in 'preschool-address', with: @preschool.address
    fill_in 'preschool-building', with: @preschool.building
    fill_in 'preschool-phonenumber', with: @preschool.phone_number
    fill_in 'preschool-access', with: @preschool.access
    select 10, from: 'preschool_open_hour_4i' 
    select 30, from: 'preschool_open_hour_5i' 
    select 20, from: 'preschool_close_hour_4i' 
    select 15, from: 'preschool_close_hour_5i' 
    fill_in 'preschool-capacity', with: @preschool.capacity
    find('#preschool_category_id').find("option[value='#{@preschool.category_id}']").select_option
    fill_in 'preschool-enail', with: @preschool.email
    fill_in 'preschool-concept', with: @preschool.concept
    # 送信するとPreschoolモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Preschool.count }.by(1)
    # 「投稿が完了しました」の文字があることを確認する
    expect(page).to have_content('投稿完了しました')
    # トップページに遷移する
    visit root_path
    # トップページには先ほど投稿した内容のツイートが存在することを確認
    expect(page).to have_content(@preschool_text)
  end
end

end
