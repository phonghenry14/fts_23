FactoryGirl.define do
  factory :question do
    course
    content "phong?"

    factory :question_with_options do
      after :create do |question|
        4.times do
          create :option, question: question
        end
      end
    end
  end
end
