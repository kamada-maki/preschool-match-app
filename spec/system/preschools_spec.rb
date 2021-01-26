# require 'rails_helper'

# RSpec.describe "Preschools", type: :system do
#   before do
#     @preschool = FactoryBot.create(:preschool)
#   end
#   context '保育園情報投稿ができるとき'do
#   it 'ログインした管理者は新規投稿できる' do
#     # トップページに移動する
#     visit root_path
#     # トップページにログインページへ遷移するボタンがあることを確認する
#     expect(page).to have_content('ログイン')
#     # ログインする
#     visit new_admin_session_path
#     fill_in 'メールアドレス', with: @admin.email
#     fill_in 'パスワード', with: @admin.password
#     find('input[name="ログイン"]').click
#     expect(current_path).to eq root_path
#     # 新規投稿ページへのリンクがあることを確認する
#     expect(page).to have_content('新規投稿')
#     # 投稿ページに移動する
#     visit new_preschool_path
#     # フォームに情報を入力する
#     fill_in 'preschool_image', with: @preschool.image
#     fill_in 'preschool_name', with: @preschool.name
#     fill_in 'preschool_post_number', with: @preschool.post_number
#     fill_in 'preschool_area_id', with: @preschool.area_id
#     fill_in 'preschool_address', with: @preschool.address
#     fill_in 'preschool_building', with: @preschool.building
#     fill_in 'preschool_phone_number', with: @preschool.phone_number
#     fill_in 'preschool_access', with: @preschool.access
#     fill_in 'preschool_open_hour', with: @preschool.open_hour
#     fill_in 'preschool_close_hour', with: @preschool.close_hour
#     fill_in 'preschool_capacity', with: @preschool.capacity
#     fill_in 'preschool_category_id', with: @preschool.category.id
#     fill_in 'preschool_email', with: @preschool.email
#     fill_in 'preschool_concept', with: @preschool.concept
#     # 送信するとPreschoolモデルのカウントが1上がることを確認する
#     expect{
#       find('input[name="commit"]').click
#     }.to change { Preschool.count }.by(1)
#     # 投稿完了ページに遷移することを確認する
#     expect(current_path).to eq preschools_path
#     # 「投稿が完了しました」の文字があることを確認する
#     expect(page).to have_content('投稿が完了しました。')
#     # トップページに遷移する
#     visit root_path
#     # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
#     expect(page).to have_selector ".content_post[style='background-image: url(#{@preschool.image});']"
#     # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
#     expect(page).to have_content(@preschool_text)
#   end
# end
#   context '保育園情報投稿ができないとき'do
#     it 'ログインしていないと新規投稿ページに遷移できない' do
#       # トップページに遷移する
#       # 新規投稿ページへのリンクがない
#     end
#   end
# end
