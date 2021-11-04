class CreateTiers < ActiveRecord::Migration[7.0]
  def change
    create_table :tiers do |t|
      t.string :name
      t.string :ghid
      t.references :creator, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tiers, :ghid, unique: true
  end
end
