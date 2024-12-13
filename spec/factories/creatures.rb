FactoryBot.define do
  factory :creature do
    uuid { SecureRandom.uuid }
    association :current_evolution, factory: "evolution"

    trait :in_danger_zone do
      hunger { 9 }
      loneliness { 9 }
      filthiness { 9 }
    end
  end
end
