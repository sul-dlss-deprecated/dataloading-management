class SetDataloadJobDefaults < ActiveRecord::Migration[7.0]
  def change
    change_table :dataload_jobs, bulk: true do |t|
      t.string :filename, null: false, default: ""
      t.string :file_pattern, null: false, default: ""
    end
  end
end
