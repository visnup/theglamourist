FactoryGirl.define do
  factory :contact do
    name         { Faker::Name.name }
    email        { Faker::Internet.email name }
    phone_number { Faker::PhoneNumber.phone_number }
    event_at     { (Kernel.rand 600).days.from_now }
  end
end
