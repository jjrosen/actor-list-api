class Addimageurl < ActiveRecord::Migration[7.2]
  def change
    add_column :actors, :image, :string
  end
end
