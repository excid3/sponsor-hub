class CreateGithubAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :github_accounts do |t|
      t.string :name
      t.string :ghid
      t.string :login
      t.string :email
      t.string :image
      t.string :token
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :github_accounts, :ghid, unique: true
    add_index :github_accounts, :login, unique: true
    add_index :github_accounts, :email, unique: true
  end
end
