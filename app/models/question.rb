class Question < ActiveRecord::Base
  belongs_to :course
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :options,
                                reject_if: lambda {|a| a[:content].blank?},
                                allow_destroy: true

end
