class AddDoneColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:surveys, :done, :boolean)
  end
end
