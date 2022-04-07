class AddStatusToOwners < ActiveRecord::Migration[7.0]
  def change
    add_column :owners, :status, :string
  end
end
