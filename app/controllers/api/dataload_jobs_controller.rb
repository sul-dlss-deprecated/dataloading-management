module Api
  # Controller for DataloadJobs
  class DataloadJobsController < Api::ApiController
    def index
      render json: {jobs: DataloadJobsService.fetch}, methods: [:organization_folio_id]
    end

    def update
      dataload_job = DataloadJob.find(params[:id])
      dataload_job.update!(params.permit(:status))
      head :no_content
    end
  end
end
