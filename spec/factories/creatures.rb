FactoryBot.define do
  factory :creature do
    uuid { SecureRandom.uuid }
    association :current_evolution, factory: "evolution"
  end
end
