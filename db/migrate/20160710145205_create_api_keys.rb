class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.citext :key, null: false, uniq: true, index: true

      t.timestamps null: false
    end
  end
end
