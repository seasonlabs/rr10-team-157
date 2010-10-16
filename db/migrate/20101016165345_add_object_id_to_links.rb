class AddObjectIdToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :post_id, :string
  end

  def self.down
    remove_column :links, :post_id
  end
end
