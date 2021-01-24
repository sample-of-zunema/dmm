# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dream, 'モデルに関するテスト', type: :model do

  before do
    @user = FactoryBot.create(:user)
    @dream = FactoryBot.build(:dream, user: @user)
  end

  describe '実際に投稿してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:dream)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      @dream.title = ""
      expect(@dream).to be_invalid
      expect(@dream.errors[:title]).to include("を入力してください")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      @dream.body = ""
      expect(@dream).to be_invalid
      expect(@dream.errors[:body]).to include("を入力してください")
    end
  end

end