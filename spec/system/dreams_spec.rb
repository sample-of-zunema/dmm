require 'rails_helper'

describe '投稿のテスト' do
  let!(:user) { create(:user) }
  let!(:dream) { create(:dream, user: user) }

  describe 'トップページ(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップページ(root_path)に一覧ページへのリンクが表示されているか' do
        expect(page).to have_link '', href: dreams_path
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end
  describe '一覧ページのテスト' do
    before do
      visit sign_in_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'commit'
      visit dreams_path
    end
    context '一覧の表示とリンクの確認' do
      it 'dreamのタイトルと内容が表示されているか' do
        (1..5).each do |_i|
          FactoryBot.build(:dream)
        end
        visit dreams_path
        Dream.all.each do |dream|
          expect(page).to have_content dream.title
          expect(page).to have_content dream.body
        end
      end
      it '夢の新規投稿ボタンが表示される' do
        expect(page).to have_link '', href: new_dream_path
      end
    end
  end
  describe '投稿のテスト' do
    before do
      visit sign_in_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'commit'
      visit new_dream_path
    end
    context '投稿処理に関するテスト' do
      it '投稿に成功するか' do
        expect(FactoryBot.build(:dream)).to be_valid
      end
      it '投稿に失敗しバリデーションチェックされエラーメッセージが返ってきているか' do
        expect(FactoryBot.build(:dream, title: '')).to be_invalid
        expect(FactoryBot.build(:dream, title: '').errors[:title]).to include
      end
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'dream[title]', with: Faker::Lorem.characters(number: 10)
        fill_in 'dream[body]', with: Faker::Lorem.characters(number: 30)
        choose 'dream_emotion_楽しい'
        fill_in 'dream[start_time]', with: DateTime.strptime('01/01/2021 10:00', '%m/%d/%Y %H:%M')
        click_button 'commit'
        expect(page).to have_current_path dream_path(Dream.last)
      end
    end
    context 'dream削除のテスト' do
      it 'dreamの削除' do
        expect { dream.destroy }.to change { Dream.count }.by(-1)
      end
    end
  end
end
