class RemoveUserFromVeiculos < ActiveRecord::Migration[7.0]
  def change
    remove_column :veiculos, :user_id
  end
end