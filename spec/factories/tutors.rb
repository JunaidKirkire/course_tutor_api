FactoryBot.define do
    factory :tutor do
        name { "Tutor Name" }
        association :course
    end
end
  