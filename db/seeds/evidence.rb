# 5つのPostに対してそれぞれエビデンスを作成
2.times do |_n|
  Evidence.create(
    post_id: 1,
    source: "http://example.com/evi-source",
    informant: Faker::University.name,
    source_updated_on: Faker::Date.between(from: '1950-1-1', to: '2021-1-20'),
    level: Faker::Number.within(range: 0..2),
    fact_or_opinion: Faker::Number.within(range: 0..2),
    data_type: Faker::Number.within(range: 0..2)
  )
end

3.times do |_n|
  Evidence.create(
    post_id: 2,
    source: "http://example.com/evi-source",
    informant: Faker::University.name,
    source_updated_on: Faker::Date.between(from: '1950-1-1', to: '2021-1-20'),
    level: Faker::Number.within(range: 0..2),
    fact_or_opinion: Faker::Number.within(range: 0..2),
    data_type: Faker::Number.within(range: 0..2)
  )
end

2.times do |_n|
  Evidence.create(
    post_id: 3,
    source: "http://example.com/evi-source",
    informant: Faker::University.name,
    source_updated_on: Faker::Date.between(from: '1950-1-1', to: '2021-1-20'),
    level: Faker::Number.within(range: 0..2),
    fact_or_opinion: Faker::Number.within(range: 0..2),
    data_type: Faker::Number.within(range: 0..2)
  )
end

1.times do |n|
  Evidence.create(
    post_id: 4,
    source: "http://example.com/evi-source",
    informant: Faker::University.name,
    source_updated_on: Faker::Date.between(from: '1950-1-1', to: '2021-1-20'),
    level: Faker::Number.within(range: 0..2),
    fact_or_opinion: Faker::Number.within(range: 0..2),
    data_type: Faker::Number.within(range: 0..2)
  )
end

4.times do |n|
  Evidence.create(
    post_id: 5,
    source: "http://example.com/evi-source",
    informant: Faker::University.name,
    source_updated_on: Faker::Date.between(from: '1950-1-1', to: '2021-1-20'),
    level: Faker::Number.within(range: 0..2),
    fact_or_opinion: Faker::Number.within(range: 0..2),
    data_type: Faker::Number.within(range: 0..2)
  )
end