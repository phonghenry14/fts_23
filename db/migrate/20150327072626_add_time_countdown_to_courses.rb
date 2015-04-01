class AddTimeCountdownToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :time_countdown, :integer
  end
end
