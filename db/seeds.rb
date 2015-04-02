User.create email: "phong@abc.com", name: "phong", role: "admin", password: "12345678"
User.create email: "phuong@abc.com", name: "phuong", role: "admin", password: "12345678"

time_countdown = 600

Course.create name: "Ruby", created_at: Time.zone.now, time_countdown: time_countdown
Course.create name: "Java", created_at: Time.zone.now, time_countdown: time_countdown
Course.create name: "PHP", created_at: Time.zone.now, time_countdown: time_countdown
Course.create name: "MySQL", created_at: Time.zone.now, time_countdown: time_countdown,
                            hastext: true

coures = Course.all
coures.each do |course|
  30.times do
    content1 = Faker::Lorem.sentence 5
    question = course.questions.create! content: "#{content1}?".gsub!(/[.]/,"")
    4.times do |n|
      content2 = Faker::Lorem.sentence 2
      correct = false
      if n == 1
        correct = true
      end
      option = question.options.create! content: content2, correct: correct
    end
  end
end
