require "rails_helper"

RSpec.describe VendorLoadService do
  # Persisted. Will be updated.
  let(:vendor1) { create(:vendor) }
  # Not persisted. Will be created.
  let(:vendor2) { build(:vendor) }
  let(:new_vendor_name) { "New #{vendor1.name}" }
  let(:new_vendor_code) { "New #{vendor1.folio_code}" }
  let(:orgs) do
    {
      "organizations" => [
        {
          "id" => vendor1.folio_id,
          "name" => new_vendor_name,
          "code" => new_vendor_code
        },
        {
          "id" => vendor2.folio_id,
          "name" => vendor2.name,
          "code" => vendor2.folio_code
        }
      ]
    }
  end

  before do
    allow(FolioClient).to receive(:organizations).and_return(orgs)
  end

  it "loads vendors from Folio" do
    expect { described_class.execute }.to change(Vendor, :count).by(1)
    expect(vendor1.reload.name).to eq(new_vendor_name)
    expect(vendor1.folio_code).to eq(new_vendor_code)
    loaded_vendor = Vendor.find_by(folio_id: vendor2.folio_id)
    expect(loaded_vendor.name).to eq(vendor2.name)
    expect(loaded_vendor.folio_code).to eq(vendor2.folio_code)
  end
end
