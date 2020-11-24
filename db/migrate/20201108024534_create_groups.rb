class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :icon
      t.string :name
      t.references :author, index: true
      t.timestamps
    end
  end
end
