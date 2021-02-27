FactoryBot.define do
  factory :get_address do
    postal_code { '123-4567' }
    prefecture_id     { 3 }
    city { '東京都' }
    address_name {'山田郡'}
    building_name {'箕輪'}
    phone_number { '08012345678' }
  end
end
