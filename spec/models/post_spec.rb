require 'rails_helper'

describe Post do
  describe '#create' do
    context '登録可能' do
      it "textが存在すれば登録できること" do
        expect(build(:post)).to be_valid
      end
    end

    context '登録不可' do
      it "textが存在しない場合は登録できないこと" do
        post = build(:post, text: nil)
        post.valid?
        expect(post.errors[:text]).to include(I18n.t('errors.messages.blank'))
      end
    end
  end
end
