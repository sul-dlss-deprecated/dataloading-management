class Vendor < ApplicationRecord
  has_many :dataload_jobs, dependent: nil

  UUID_REGEX = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/

  validates :folio_id, presence: true, uniqueness: true, format: {with: UUID_REGEX, message: "expecting a valid UUID"}
  validates :folio_code, presence: true
  validates :name, presence: true
  validates :highlight, inclusion: [true, false]

  # Notes on fields in this model:
  # folio_id - UUID for vendor record in Folio
  # folio_code - code string for vendor in Folio, e.g. "SFSYMPHONY-SUL"
  # name - name for vendor in Folio, e.g. "San Francisco Symphony"
  # highlight - initially this will be used to display the initial priority vendors on the homepage

  # Folio vendor records also have a "status" field, but it is currently not used in this app.
end
