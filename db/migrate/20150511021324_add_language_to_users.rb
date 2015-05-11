class AddLanguageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :language, :string
    add_column :users, :string, :string
  end
end
