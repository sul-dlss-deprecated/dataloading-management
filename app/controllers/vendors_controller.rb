# List and show vendor instances
class VendorsController < ApplicationController
  # GET /vendors
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/f8e113dc-1863-41ea-b866-b6a1c76e46b3
  def show
    @vendor = Vendor.find_by!(folio_id: params[:folio_id])
  end
end
