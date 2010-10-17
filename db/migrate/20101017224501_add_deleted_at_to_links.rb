class AddDeletedAtToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :deleted_at, :datetime
  end

  def self.down
    remove_column :links, :deleted_at
  end
end
