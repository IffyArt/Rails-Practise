class AddPathToFileRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :file_records, :path, :string
  end
end
