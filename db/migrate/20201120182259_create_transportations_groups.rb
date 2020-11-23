class CreateTransportationsGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations_groups do |t|
      t.references :transportation, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
