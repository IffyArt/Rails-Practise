class AddPathToFileRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :file_records, :file, :string
  end
end
