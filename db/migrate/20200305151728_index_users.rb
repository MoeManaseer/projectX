class IndexUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :id
  end
end
