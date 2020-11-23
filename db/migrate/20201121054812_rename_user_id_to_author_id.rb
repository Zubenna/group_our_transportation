class RenameUserIdToAuthorId < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :user_id, :author_id
  end
end
