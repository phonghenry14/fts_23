class Examination < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true

  before_save :default_status
  before_create :init_answers
  before_update :change_status

  private
  def init_answers
    self.course.questions.sample(20).each do |question|
      self.answers.build question: question
    end
  end

  def default_status
    self.status = "Testing"
  end

  def change_status
    self.status = "Summited"
  end
end
