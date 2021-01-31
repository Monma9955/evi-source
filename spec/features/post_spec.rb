require 'rails_helper'

feature 'posts', type: :feature do
  given!(:posts_a) { create(:post, :posts_a) }
  given!(:posts_b) { create(:post, :posts_b) }
  given!(:posts_c) { create(:post, :posts_c) }

  scenario 'ユーザーは一覧ページからPostの並び順を変更する' do
    visit posts_path

    # Post一覧ページが表示され、投稿も表示されている
    expect(page).to have_content "投稿されたエビデンス一覧"
    within '.number1' do
      expect(page).to have_content "3番目の投稿"
    end
    within '.number2' do
      expect(page).to have_content "2番目の投稿"
    end
    within '.number3' do
      expect(page).to have_content "1番目の投稿"
    end

    # 並び順変更ボタンをクリックする
    click_button '新着順'

    # ボタンの名称が変わり、投稿の順番が変わっている
    expect(page).to have_content "古い順"
    within '.number1' do
      expect(page).to have_content "1番目の投稿"
    end
    within '.number2' do
      expect(page).to have_content "2番目の投稿"
    end
    within '.number3' do
      expect(page).to have_content "3番目の投稿"
    end
  end
end
