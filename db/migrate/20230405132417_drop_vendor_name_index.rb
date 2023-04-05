class DropVendorNameIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :vendors, :name
  end
end
