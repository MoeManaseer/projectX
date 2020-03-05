class AddToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :input, :string
    add_column :submissions, :output, :string
    add_column :submissions, :status, :string
  end
end
