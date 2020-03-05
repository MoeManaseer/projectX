class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.timestamps
      t.integer :user_id
      t.integer :code_id
    end
  end
end
