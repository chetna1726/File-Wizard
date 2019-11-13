class AddFileToUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :uploads, :file, :string
  end
end
