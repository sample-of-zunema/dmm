require 'rails_helper'

describe '投稿のテスト' do

  let!(:user) { create(:user) }
  let!(:dream) { create(:dream, user: user) }

  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に一覧ページへのリンクが表示されているか' do
        expect(page).to have_link "", href: dreams_path
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end
  describe '一覧画面のテスト' do
    before do
      visit dreams_path
    end
    context '一覧の表示とリンクの確認' do
      it "dreamのタイトルと内容が表示されているか" do
        (1..5).each do |i|
          FactoryBot.build(:dream)
        end
        visit dreams_path
        Dream.all.each_with_index do |dream|
          expect(page).to have_content dream.title
          expect(page).to have_content dream.body
        end
      end
      it '夢の新規投稿ボタンが表示される' do
        expect(page).to have_link "", href: new_dream_path
      end
    end
  end
end