class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :address
      t.string :residence_type
      t.string :city
      t.string :state
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.string :client_id

      t.timestamps
    end
  end
end
