class Vendor < ApplicationRecord
  UUID_REGEX = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/

  validates :folio_id, presence: true, uniqueness: true, format: {with: UUID_REGEX, message: "expecting a valid UUID"}
  validates :folio_code, presence: true
  validates :name, presence: true
  validates :highlight, inclusion: [true, false]
end
