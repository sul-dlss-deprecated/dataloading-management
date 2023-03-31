require "rails_helper"

RSpec.describe "Data Loading Management", type: :request do
  context "when visiting the homepage" do
    it "responds with success" do
      get "/"
      expect(response).to have_http_status(:ok)
      expect(response.body).to match(/Data Loading Management Statistics/)
      expect(response.body).to match(/Status/)
      expect(response.body).to match(/Vendors/)
      expect(response.body).to match(/Schedule/)
    end
  end
end
