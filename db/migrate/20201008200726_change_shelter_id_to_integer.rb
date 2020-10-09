class ChangeShelterIdToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :shelter_id
    add_reference :pets, :shelter, foreign_key: true
  end
end
