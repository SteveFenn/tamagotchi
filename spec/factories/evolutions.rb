FactoryBot.define do
  factory :evolution do
    name { "test-evolution" }

    trait :baby do
      # No parent evolutions
    end
  end
end
