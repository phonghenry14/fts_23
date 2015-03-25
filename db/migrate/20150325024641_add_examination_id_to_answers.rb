class AddExaminationIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :examination_id, :integer
  end
end
