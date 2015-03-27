class AddCorrectAnswersToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :correct_answers, :integer
  end
end
