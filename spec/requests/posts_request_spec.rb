require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    let!(:posts) { create(:post) }

    before do
      get posts_url
    end

    it "リクエストが成功すること" do
      expect(response.status).to eq 200
    end

    it "投稿が表示されていること" do
      expect(response.body).to include "平成27年の東京都の人口は13,515,271人である。"
    end
  end
end
