FactoryBot.define do
  factory :creature do
    uuid { SecureRandom.uuid }
  end
end