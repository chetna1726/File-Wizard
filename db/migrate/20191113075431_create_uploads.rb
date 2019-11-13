class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :title
      t.string :desc
      t.string :url
      t.integer :privacy, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
