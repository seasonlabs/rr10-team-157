class AddPostDateToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :post_date, :datetime
  end

  def self.down
    remove_column :links, :post_date
  end
end
