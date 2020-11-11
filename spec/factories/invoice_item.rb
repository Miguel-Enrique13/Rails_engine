FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.between(from: 1, to: 10) }
    unit_price { Faker::Number.decimal(_digits: 2) }
    item
    invoice
  end
end
