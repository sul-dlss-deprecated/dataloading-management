class DataloadJobsController < ApiController
  def update
    dataload_job = DataloadJob.find(params[:id])
    dataload_job.update!(params.permit(:status))
    head :no_content
  end
end
