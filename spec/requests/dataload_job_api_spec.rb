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
end
