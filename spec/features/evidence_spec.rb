require 'rails_helper'

feature 'evidences', type: :feature do

  scenario 'ユーザーはPostとEvidenceを投稿する' do
    visit root_path

    # ルートパスがpost・evidenceの投稿画面(evidences#new)である
    expect(page).to have_content "投稿内容"
    expect(page).to have_content "根拠・情報源"
    expect(page).to have_content "情報提供元"
    expect(page).to have_content "情報の最終更新日時"
    expect(page).to have_content "情報レベル"
    expect(page).to have_content "情報の種類"
    expect(page).to have_content "備考"
    expect(page).to have_button "投稿する"

    # post・evidenceの投稿で各テーブルにレコードが増えている
    expect {
      fill_in '投稿内容', with: "ああ"
      fill_in '根拠・情報源', with: "ああ"
      fill_in '情報提供元', with: "ああ"
      select "2000", from: 'post_evidences_attributes_0_source_updated_on_1i'
      select "1月", from: 'post_evidences_attributes_0_source_updated_on_2i'
      select "1", from: 'post_evidences_attributes_0_source_updated_on_3i'
      select "一次情報", from: '情報レベル'
      select "事実", from: '事実か私見か'
      select "統計", from: '情報の種類'
      fill_in "備考", with: "ああ"
      click_button '投稿する'
    }.to change(Post, :count).by(1) & change(Evidence, :count).by(1)
  end

end