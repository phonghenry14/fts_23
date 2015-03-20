class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :role, null: false, default: "normal"

      t.timestamps null: false
    end
  end
end
