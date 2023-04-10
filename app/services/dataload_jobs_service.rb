# Fetch Dataload Jobs that are ready to schedule and update the status to queued
class DataloadJobsService
  # Queries for all dataload_job records prior to the current DateTime with a
  # status of 'scheduled' and updates the status to 'queued' then returns
  # all jobs with a current status of 'queued'
  #
  # return [ActiveRecord::Relation] the records to be serialized to JSON in the API
  def self.fetch
    current_datetime = DateTime.now
    DataloadJob.where(status: "scheduled", date: ...current_datetime).update_all(status: :queued)
    DataloadJob.where(status: "queued", date: ...current_datetime)
  end
end
