class CreateGroupsTransportation < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_transportations, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :transportation, index: true
    end
  end
end
