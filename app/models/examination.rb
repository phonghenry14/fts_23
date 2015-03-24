class Examination < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :course, class_name: 'Course', foreign_key: :course_id
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true
end
