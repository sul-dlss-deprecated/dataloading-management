class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :folio_id, null: false
      t.string :folio_code, null: false
      t.string :name, null: false
      t.boolean :highlight, default: false

      t.timestamps
    end

    add_index :vendors, :folio_id, unique: true
    add_index :vendors, :name, unique: true
  end
end
