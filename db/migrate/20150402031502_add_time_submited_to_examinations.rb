class AddTimeSubmitedToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :time_submited, :integer
  end
end
