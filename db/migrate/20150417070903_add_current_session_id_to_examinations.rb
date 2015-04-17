class AddCurrentSessionIdToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :current_session_id, :string
  end
end
