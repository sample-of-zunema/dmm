# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inquiry, 'モデルに関するテスト', type: :model do
  describe '実際に問い合わせてみる' do
    it '有効な問い合わせ内容の場合は送信されるか' do
      expect(FactoryBot.build(:inquiry)).to be_valid
    end
  end
  context '空白のバリデーションチェック' do
    it 'nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      expect(FactoryBot.build(:inquiry, name: '')).to be_invalid
      expect(FactoryBot.build(:inquiry, name: '').errors[:name]).to include
    end
    it 'emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      expect(FactoryBot.build(:inquiry, email: '')).to be_invalid
      expect(FactoryBot.build(:inquiry, email: '').errors[:email]).to include
    end
    it 'messageが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      expect(FactoryBot.build(:inquiry, message: '')).to be_invalid
      expect(FactoryBot.build(:inquiry, message: '').errors[:message]).to include
    end
  end
end
