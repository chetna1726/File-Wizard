class CreateJoinTableSharedUpload < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :uploads, table_name: :shared_uploads do |t|
      t.index [:user_id, :upload_id]
    end
  end
end
