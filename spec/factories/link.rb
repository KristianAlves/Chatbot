FactoryBot.define do
    factory :link do
       description FFaker::Lorem.phrase
       link FFaker::Lorem.phrase
       company
    end
end