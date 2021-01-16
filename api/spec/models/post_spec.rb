require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿テスト' do
    context '新規投稿がうまくいくとき' do
      it '必須項目(必要条件)が存在すれば登録できる' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Titleを入力してください")
      end
      it 'titleが30文字以上の場合はエラー' do
        @post.title = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @post.valid?
        expect(@post.errors.full_messages).to include("Titleは30文字以内で入力してください")
      end
      it 'pointが空では登録できない' do
        @post.point = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Pointを入力してください")
      end
      it 'pointが140文字以上の場合エラー' do
        @post.point = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @post.valid?
        expect(@post.errors.full_messages).to include("Pointは140文字以内で入力してください")
      end
      it 'userが紐付いて無いと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
