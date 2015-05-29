FactoryGirl.define do
  factory :answer do
    examination
    question
    option
    correct false
  end
end
