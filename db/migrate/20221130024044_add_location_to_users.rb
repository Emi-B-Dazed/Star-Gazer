class AddLocationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :user, index: true
    add_column :locations, :pollution, :integer
  end
end
