class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.text :description
      t.string :approximate_age
      t.string :sex
      t.string :adoption_status
      t.string :shelter_id
    end
  end
end
