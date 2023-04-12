class DataloadJob < ApplicationRecord
  belongs_to :vendor
  delegate :folio_id, to: :vendor, prefix: :organization

  enum :status, {
    scheduled: 0, # the initial value when a job is created
    queued: 1, # the status set when the API has reported the job
    in_progress: 2, # when airflow has started the job it will update this value via the API
    failed: 3, # if the airflow job fails for any reason, it should update this value via the API
    completed: 4 # when the job completes successfully in airflow, this value will be updated via the API
  }, suffix: true

  enum :recurrence, {
    none: 0,
    daily: 1,
    weekly: 2,
    monthly: 3,
    yearly: 4
  }, suffix: true

  # Notes on fields in this model:
  # date: now (if immediate), the date selected for one-off (recurrence none), the next recurrence date
  # dataload_profile_id: The id of the folio data load profile selected
  # created_by: The sunetid of the user creating the job
  # additional_contacts: Array of the sunetid(s) of any additional users to be notified of job state in the data pipeline.
  # filename (optional): The filename of a manually uploaded file
  # file_pattern (optional): The filename pattern for airflow to use in order to find the correct vendor file
  # processing_tasks: Array of selected known data processing tasks.
  # log (large text field to capture any provided log data from airflow on failure)
  # interface_id: The id of the interface in the organization.
end
