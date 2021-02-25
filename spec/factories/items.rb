FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    content           {Faker::Lorem.sentence}
    category_id       { 3 }
    condition_id      { 3 }
    delivery_fee_id   { 3 }
    prefecture_id     { 3 }
    days_to_ship_id   { 3 }
    price             { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
