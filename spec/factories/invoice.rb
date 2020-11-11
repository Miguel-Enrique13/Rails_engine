FactoryBot.define do
  factory :invoice do
    merchant
    customer
    status { "Shipped" }
  end
end
