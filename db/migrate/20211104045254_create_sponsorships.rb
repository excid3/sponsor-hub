class CreateSponsorships < ActiveRecord::Migration[7.0]
  def change
    create_table :sponsorships do |t|
      t.references :tier, null: false, foreign_key: true
      t.references :supporter, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
