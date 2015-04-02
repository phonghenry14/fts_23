class AddTimeStartToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :time_start, :datetime
  end
end
