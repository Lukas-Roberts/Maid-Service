class CreateMaids < ActiveRecord::Migration[5.2]
  def change
    create_table :maids do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :experience
      t.integer :overall_rating
      t.integer :number_of_ratings

      t.timestamps
    end
  end
end
