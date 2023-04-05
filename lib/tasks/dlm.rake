namespace :dlm do
  desc "Load vendors from Folio"
  task load_vendor: :environment do
    VendorLoadService.execute
  end
end
