# Create / update Vendors from Folio organizations API
class VendorLoadService
  def self.execute
    FolioClient.organizations["organizations"].each do |organization|
      vendor = Vendor.find_or_initialize_by(folio_id: organization["id"])
      vendor.name = organization["name"]
      vendor.folio_code = organization["code"]
      vendor.save!
    end
  end
end
