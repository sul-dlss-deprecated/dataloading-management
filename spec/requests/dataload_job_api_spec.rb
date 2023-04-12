require "rails_helper"

RSpec.describe "/api/dataload_job" do
  describe "PUT /api/dataload_job/{id}" do
    let(:dataload_job) { create(:dataload_job, status: :in_progress) }

    let(:payload) do
      {
        status: "completed"
      }
    end

    before do
      allow(ENV).to receive(:fetch).with("API_TOKEN", "")
        .and_return("sekret")
    end

    context "when authenticated" do
      it "updates the status" do
        put "/api/dataload_jobs/#{dataload_job.id}",
          params: payload.to_json,
          headers: {
            "Authorization" => "Bearer sekret",
            "Content-Type" => "application/json"
          }
        expect(response).to have_http_status(:no_content)
      end
    end

    context "when not authenticated" do
      it "returns unauthorized" do
        put "/api/dataload_jobs/#{dataload_job.id}",
          params: payload.to_json,
          headers: {
            "Authorization" => "Bearer xxx",
            "Content-Type" => "application/json"
          }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "POST /api/dataload_jobs" do
    let!(:dataload_job1) { create(:dataload_job, :recurs_daily_yesterday) }
    let(:dataload_job2) { create(:dataload_job, :recurs_daily_tomorrow) }
    let(:response_body) do
      {
        jobs: [dataload_job1]
      }
    end

    before do
      allow(ENV).to receive(:fetch).with("API_TOKEN", "")
        .and_return("sekret")
    end

    context "when a job is ready to schedule" do
      it "returns the job" do
        get "/api/dataload_jobs",
          headers: {
            "Authorization" => "Bearer sekret",
            "Content-Type" => "application/json"
          }
        expect(response).to have_http_status(:ok)
        dataload_job1.reload
        expect(response.body).to eq response_body.to_json(methods: :organization_folio_id)
      end
    end
  end
end
