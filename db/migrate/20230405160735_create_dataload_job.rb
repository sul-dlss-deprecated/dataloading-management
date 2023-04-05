class CreateDataloadJob < ActiveRecord::Migration[7.0]
  def change
    create_table :dataload_jobs do |t|
      t.belongs_to :vendor, foreign_key: true
      t.integer :status, default: 0, null: false
      t.integer :recurrence, default: 0, null: false
      t.boolean :enabled, default: true, null: false
      t.datetime :date
      t.string :dataload_profile_id, null: false
      t.string :created_by, null: false
      t.jsonb :additional_contacts, default: [], null: false
      t.string :filename
      t.string :file_pattern
      t.jsonb :processing_tasks, default: [], null: false
      t.text :log
      t.timestamps
    end
  end
end
