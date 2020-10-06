FactoryBot.define do

  factory :evidence do
    source                { "https://www.e-stat.go.jp/" }
    informant             { "e-Stat(総務省統計局)" }
    source_updated_on     { "20200527" }
    level                 { 0 }
    fact_or_opinion       { 0 }
    data_type             { 0 }
    reference             { "東京都の人口総数を参照" }
    association :post
  end

end
