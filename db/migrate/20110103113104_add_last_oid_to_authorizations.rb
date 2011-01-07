class AddLastOidToAuthorizations < ActiveRecord::Migration
  def self.up
    add_column :authorizations, :last_oid, :string
  end

  def self.down
    remove_column :authorizations, :last_oid
  end
end
