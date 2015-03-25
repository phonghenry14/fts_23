class AddStatusToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :status, :string
  end
end
