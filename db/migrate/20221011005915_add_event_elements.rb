class AddEventElements < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :happens_at, :date
    add_column :events, :tag, :string
    add_column :events, :optimal_location, :string
    add_column :events, :public_bool, :boolean
    add_reference :events, :user, index: true
  end
end
