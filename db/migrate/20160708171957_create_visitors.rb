class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors, id: :uuid do |t|
      t.citext :email, null: false

      t.timestamps null: false
    end

    add_index :visitors, :email, unique: true
  end
end
