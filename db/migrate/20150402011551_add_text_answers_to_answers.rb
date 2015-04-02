class AddTextAnswersToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :text_answers, :string
  end
end
