FactoryGirl.define do
  factory :user do
    name "phong"
    sequence :email do |n|
      "phong#{n}@gmail.com"
    end
    password "nhiepphong"
    password_confirmation "nhiepphong"
    role "admin"
  end
end
