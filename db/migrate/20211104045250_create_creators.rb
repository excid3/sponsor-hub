class CreateCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :creators do |t|
      t.references :github_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
