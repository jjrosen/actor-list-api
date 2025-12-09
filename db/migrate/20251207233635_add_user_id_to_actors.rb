class AddUserIdToActors < ActiveRecord::Migration[7.2]
  def change
    add_column :actors, :user_id, :integer
  end
end
