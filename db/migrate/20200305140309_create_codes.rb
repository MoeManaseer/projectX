class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.string :info
      t.string :name
      t.timestamps
      t.integer :user_id
    end
  end
end
