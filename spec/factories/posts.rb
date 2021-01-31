FactoryBot.define do
  factory :post do
    text  { "平成27年の東京都の人口は13,515,271人である。" }

    # 投稿を複数用意するシチュエーションで使用
    trait :posts_a do
      text { "1番目の投稿" }
    end

    trait :posts_b do
      text { "2番目の投稿" }
    end

    trait :posts_c do
      text { "3番目の投稿" }
    end
  end
end
