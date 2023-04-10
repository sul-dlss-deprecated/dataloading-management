# Controller for DataloadJobs
class DataloadJobsController < ApplicationController
  def index
    @dataload_jobs = DataloadJob.all.order(updated_at: :desc)
  end

  def show
    @dataload_job = DataloadJob.find(params[:id])
  end
end
