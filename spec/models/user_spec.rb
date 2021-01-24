# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do

  describe "実際に登録してみる" do
    it "有効な登録内容の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      expect(FactoryBot.build(:user, name: "")).to be_invalid
      expect(FactoryBot.build(:user, name: "").errors[:name]).to include()
    end
    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      expect(FactoryBot.build(:user, email: "")).to be_invalid
      expect(FactoryBot.build(:user, email: "").errors[:email]).to include()
    end
    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      expect(FactoryBot.build(:user, password: "")).to be_invalid
      expect(FactoryBot.build(:user, password: "").errors[:password]).to include()
    end
  end

end