class AddChoicesColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:questions, :choices, :string, array: true, default: '{}')
  end
end
