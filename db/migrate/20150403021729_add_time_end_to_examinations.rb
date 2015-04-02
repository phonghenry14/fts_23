class AddTimeEndToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :time_end, :datetime
  end
end
