require 'rails_helper'

feature 'posts', type: :feature do
  given!(:posts) { create(:post) }

  scenario 'ユーザーは一覧ページからPostの並び順を変更する' do
    visit posts_path

    # Post一覧ページが表示され、投稿も表示されている
    expect(page).to have_content "投稿されたエビデンス一覧"
    within '.number1' do
      expect(page).to have_content "平成27年の東京都の人口は13,515,271人である。"
    end
    # 並び順変更ボタンをクリックする
    click_button '新着順'
    # ボタンの名称が変わっている
    expect(page).to have_content "古い順"
  end
end
