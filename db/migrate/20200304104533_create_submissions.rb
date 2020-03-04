class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.string :code
      t.string :output
      t.string :status
      t.integer :user_id
      t.timestamps
    end
  end
end
