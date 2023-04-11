require "rails_helper"

RSpec.describe "/vendors" do
  let!(:dataload_job1) { create(:dataload_job) }
  let!(:dataload_job2) { create(:dataload_job) }

  before { sign_in(create(:user)) }

  describe "GET /" do
    it "renders a list of dataload jobs" do
      get "/"
      expect(response).to be_successful
      body = response.body

      expect(body).to include("Job ID</th>")
      expect(body).to include("Vendor</th>")

      expect(body).to include("/dataload_jobs/#{dataload_job1.id}\">#{dataload_job1.id}</a>")
      expect(body).to include("/dataload_jobs/#{dataload_job2.id}\">#{dataload_job2.id}</a>")
    end
  end

  describe "GET /dataload_jobs/{id}" do
    it "renders dataload job display" do
      get "/dataload_jobs/#{dataload_job2.id}"
      expect(response).to be_successful
      expect(response.body).to include("Dataload Job #{dataload_job2.id}")
    end
  end
end
