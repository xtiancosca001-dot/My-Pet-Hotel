class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.string :pet_type
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
