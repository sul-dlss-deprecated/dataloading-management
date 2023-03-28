require "rails_helper"

RSpec.describe "Data Loading Management", type: :request do
  context "when visiting the homepage" do
    it "responds with success" do
      get "/"
      expect(response).to be_successful
    end
  end
end
