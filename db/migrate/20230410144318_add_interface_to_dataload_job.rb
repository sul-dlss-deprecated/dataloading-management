class AddInterfaceToDataloadJob < ActiveRecord::Migration[7.0]
  def change
    add_column :dataload_jobs, :interface_id, :string
  end
end
