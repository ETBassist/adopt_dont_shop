class ChangePetsAdoptionStatusColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :adoption_status, :text
  end
end
