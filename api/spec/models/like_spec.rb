require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'ストック機能テスト' do
    context 'ストックが成功する場合' do
      it '必須項目(必要条件)が存在すれば登録できる' do
        expect(@like).to be_valid
      end
    end
    context 'ストック機能が失敗する場合' do
      it 'postが紐付いて無いと保存できない' do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Postを入力してください")
      end
      it 'userが紐付いて無いと保存できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
