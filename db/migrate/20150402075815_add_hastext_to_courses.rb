class AddHastextToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :hastext, :boolean
  end
end
