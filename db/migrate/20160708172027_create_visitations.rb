class CreateVisitations < ActiveRecord::Migration
  def change
    create_table :visitations, id: :uuid do |t|
      t.references :visitor, null: false
      t.citext :address, null: false

      t.timestamps null: false
    end

    add_index :visitations, :visitor_id
    add_index :visitations, :address
  end
end
