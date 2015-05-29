FactoryGirl.define do
  factory :examination do
    course
    user
    status "Ready"
  end
end
