class SetDataloadJobDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column_default :dataload_jobs, :filename, ""
    change_column_default :dataload_jobs, :file_pattern, ""
  end
end
