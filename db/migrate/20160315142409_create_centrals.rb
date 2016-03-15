class CreateCentrals < ActiveRecord::Migration
  def change
    create_table :centrals do |t|
      t.string :key
      t.text :value
      t.text :description

      t.timestamps null: false
    end
  end
end
