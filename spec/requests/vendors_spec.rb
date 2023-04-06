require "rails_helper"

RSpec.describe "/vendors" do
  let!(:vendor1) { create(:vendor) }
  let!(:vendor2) { create(:vendor) }

  before { sign_in(create(:user)) }

  describe "GET /vendors" do
    it "renders a list of vendors" do
      get "/vendors"
      expect(response).to be_successful
      body = response.body

      expect(body).to include("Folio's Vendor Status</th>")
      expect(body).to include("Last Scheduled Job</th>")

      expect(body).to include("/vendors/#{vendor1.folio_id}\">#{vendor1.name}</a>")
      expect(body).to include("ID: #{vendor1.folio_id}")
      expect(body).not_to include(vendor1.folio_code)

      expect(body).to include("/vendors/#{vendor2.folio_id}\">#{vendor2.name}</a>")
      expect(body).to include("ID: #{vendor2.folio_id}")
      expect(body).not_to include(vendor2.folio_code)
    end
  end

  describe "GET /vendor/{folio_id}" do
    it "renders vendor display" do
      get "/vendors/#{vendor2.folio_id}"
      expect(response).to be_successful
      expect(response.body).to include(vendor2.folio_id)
      expect(response.body).to include(vendor2.folio_code)
    end

    it "raises ActiveRecord::RecordNotFound when vendor doesn't exist" do
      expect { get "/vendors/not-a-uuid" }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
