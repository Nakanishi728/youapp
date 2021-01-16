require 'rails_helper'

RSpec.describe Pickup, type: :model do
  before do
    @pickup = FactoryBot.build(:pickup)
  end

  describe 'ピックアップ機能テスト' do
    context 'ピックアップが成功する場合' do
      it '必須項目(必要条件)が存在すれば登録できる' do
        expect(@pickup).to be_valid
      end
    end
    context 'ストック機能が失敗する場合' do
      it 'postが紐付いて無いと保存できない' do
        @pickup.post = nil
        @pickup.valid?
        expect(@pickup.errors.full_messages).to include("Postを入力してください")
      end
      it 'userが紐付いて無いと保存できない' do
        @pickup.user = nil
        @pickup.valid?
        expect(@pickup.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
