class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string  :name
      t.integer :distance
      t.references :author, index: true
      t.timestamps
    end
    add_foreign_key :transportations, :users, column: :author_id
  end
end
