class Evidence < ApplicationRecord
  belongs_to :post

  enum level:{ primary: 0, secondary: 1, tertiary: 2 }
  # primary = 一次情報 secondary = 二次情報 tertiary = 三次情報
  enum fact_or_opinion:{ fact: 0, opinion: 1, both: 2 }
  # fact = 事実 opinion = 私見 both = どちらも
  enum data_type:{ verification:0, statistical:1, questionary:2 }
  # verification = 検証(結果) statistical = 統計(結果) questionary = アンケート(結果)
end
