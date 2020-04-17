class CreateTestsub < ActiveRecord::Migration[5.2]
  def change
    create_table :testsubs do |t|
      t.string :code_id
      t.string :input
      t.string :output
      t.timestamps
    end
  end
end
