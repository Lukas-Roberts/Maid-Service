class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :usertype
      t.string :google_token
      t.string :google_refresh_token
      t.references :accountable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
