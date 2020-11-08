class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.integer :user_id
      t.string :name
      t.integer :distance
      t.timestamps
    end
  end
end
