class AddIndexMessage < ActiveRecord::Migration[7.2]
  def change
    add_index :messages, :number, unique: true
  end
end
