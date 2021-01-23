# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dream, "モデルに関するテスト", type: :model do

  before do
    @dream = FactoryBot.create(:dream)
  end

  describe '実際に投稿してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.bulid(:dream)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      dream = @dream
      dream = Dream.new(emotion: '楽しい', title: '', body: "dreams", start_time: DateTime.strptime("01/01/2021 10:00", "%m/%d/%Y %H:%M"))
      expect(dream).to be_invalid
      expect(dream.errors[:title]).to include("can't be blank")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      dream = @dream
      dream = Dream.new(emotion: '楽しい', title: 'dream', body: '', start_time: DateTime.strptime("01/01/2021 10:00", "%m/%d/%Y %H:%M"))
      expect(dream).to be_invalid
      expect(dream.errors[:body]).to include("can't be blank")
    end
  end

end