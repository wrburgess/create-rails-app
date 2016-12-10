FactoryGirl.define do
  factory :user, aliases: [:admin, :staff, :customer] do
    email { Faker::Internet.email }
    password { "12345678" }
    password_confirmation { "12345678" }
    confirmed_at Time.current
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    time_zone { "UTC" }
    archived { false }
    test { false }
    dummy { false }
    roles { [UserRoles::CUSTOMER] }

    trait :admin do
      roles { [UserRoles::ADMIN] }
    end

    trait :staff do
      roles { [UserRoles::STAFF] }
    end

    trait :customer do
      roles { [UserRoles::CUSTOMER] }
    end

    trait :archived do
      archived { true }
    end

    trait :test do
      test { true }
    end

    trait :dummy do
      dummy { true }
    end
  end
end
