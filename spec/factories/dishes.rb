FactoryBot.define do
  factory :dish do
    uuid { SecureRandom.uuid }
    name { "test dish" }
    decrease_hunger_by { 1 }
  end
end
