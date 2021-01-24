RSpec.describe '/preschools', type: :request do
  # before do
  #   @preschool = FactoryBot.build(:preschool)
  # end

  # describe 'GET /index' do
  #   it 'indexアクションへリクエストすると正常にリクエストが返ってくる' do
  #     get preschools_path
  #     expect(response.status).to eq 200
  #   end
  #   it '保育園名が表示されている' do
  #     get preschools_path
  #     expect(response.body).to include @preschool.name
  #   end
  #   it 'カテゴリーが表示されている' do
  #     get preschools_path
  #     expect(response.body).to include @preschool.category_id.name
  #   end
  #   it '園の特徴が表示されている' do
  #     get preschools_path
  #     expect(response.body).to include @preschool.concept
  #   end
  # end
  # describe 'GET /show' do
  #   it 'showアクションへリクエストすると正常にリクエストが返ってくる' do
  #     get preschool_path(@preschool)
  #     expect(response.status).to eq 200
  #   end
  #   it 'Nameが表示されている' do
  #     get preschool_path(@preschool)
  #     expect(response.body).to include @preschool.name
  #   end
  #   it 'emailが表示されている' do
  #     get preschool_path(@preschool)
  #     expect(response.body).to include @preschool.email
  #   end
  # end
  # describe 'GET /new' do
  #   it 'newアクションへリクエストすると正常にリクエストが返ってくる' do
  #     get new_preschool_path
  #     expect(response.status).to eq 200
  #   end
  # end
  # describe 'GET /edit' do
  #   it 'editアクションへリクエストすると正常にリクエストが返ってくる' do
  #     get edit_preschool_path(@preschool)
  #     expect(response.status).to eq 200
  #   end
  #   it 'Nameが表示されている' do
  #     get edit_preschool_path(@preschool)
  #     expect(response.body).to include @preschool.name
  #   end
  #   it 'emailが表示されている' do
  #     get edit_preschool_path(@preschool)
  #     expect(response.body).to include @preschool.email
  #   end
  # end
  # describe 'POST /create' do
  #   context 'パラメーターが妥当な場合' do
  #     it 'リクエストが成功すること' do
  #       post preschools_path, params: { preschool: FactoryBot.attributes_for(:preschool) }
  #       expect(response.status).to eq 302
  #     end
  #     it 'preschoolが登録されること' do
  #       expect do
  #         post preschools_path, params: { preschool: FactoryBot.attributes_for(:preschool) }
  #       end.to change(User, :count).by(1)
  #     end
  #     it 'リダイレクトすること' do
  #       post preschools_path, params: { preschool: FactoryBot.attributes_for(:preschool) }
  #       expect(response).to redirect_to User.last
  #     end
  #   end
  #   context 'パラメータが不正な場合' do
  #     it 'リクエストが成功すること' do
  #       post preschools_path, params: { preschool: FactoryBot.attributes_for(:preschool, :invalid) }
  #       # Userモデルにvalidatesを加えたので、invalidの場合リダイレクトしなくなるので302→200に変更
  #       expect(response.status).to eq 200
  #     end
  #   end
  # end
  # describe 'PATCH /update' do
  #   context 'パラメーターが妥当な場合' do
  #     it 'リクエストが成功すること' do
  #       patch preschool_path(@preschool), params: { preschool: FactoryBot.attributes_for(:preschool) }
  #       expect(response.status).to eq 302
  #     end
  #     it 'リダイレクトすること' do
  #       put preschool_path(@preschool), params: { preschool: FactoryBot.attributes_for(:preschool) }
  #       expect(response).to redirect_to User.last
  #     end
  #   end
  #   context 'パラメータが不正な場合' do
  #     it 'リクエストが成功すること' do
  #       put preschool_path(@preschool), params: { preschool: FactoryBot.attributes_for(:preschool, :invalid) }
  #       # Userモデルにvalidatesを加えたので、invalidの場合リダイレクトしなくなるので302→200に変更
  #       expect(response.status).to eq 200
  #     end
  #   end
  # end
  # describe 'DELETE /destroy' do
  #   it 'リクエストが成功すること' do
  #     delete preschool_path(@preschool)
  #     expect(response.status).to eq 302
  #   end
  #   it 'preschoolが削除されること' do
  #     expect do
  #       delete preschool_path(@preschool)
  #     end.to change(User, :count).by(-1)
  #   end
  #   it '削除完了画面にリダイレクトすること' do
  #     delete preschool_path(@preschool)
  #     expect(response).to redirect_to preschools_path
  #   end
  # end
end
