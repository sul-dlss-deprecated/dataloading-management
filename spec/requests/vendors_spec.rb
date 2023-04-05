require "rails_helper"

RSpec.describe "/vendors" do
  let!(:vendor) { create(:vendor) }

  before { sign_in(create(:user)) }

  describe "GET /vendors" do
    it "renders a list of vendors" do
      get "/vendors"
      expect(response).to be_successful
      expect(response.body).to include(vendor.folio_id)
      expect(response.body).not_to include(vendor.folio_code)
    end
  end

  describe "GET /vendor/{folio_id}" do
    it "renders vendor display" do
      get "/vendors/#{vendor.folio_id}"
      expect(response).to be_successful
      expect(response.body).to include(vendor.folio_id)
      expect(response.body).to include(vendor.folio_code)
    end

    it "raises ActiveRecord::RecordNotFound when vendor doesn't exist" do
      expect { get "/vendors/not-a-uuid" }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
