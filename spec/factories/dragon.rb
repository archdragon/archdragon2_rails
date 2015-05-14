FactoryGirl.define do
  factory :dragon do
    initialize_with { Dragon.new(user: User.new) }
  end
  trait :hungry do
    after(:build) do |dragon|
      dragon.make_hungry!
    end
  end
end
