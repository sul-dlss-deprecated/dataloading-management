# UI controller for person users of this application
class VendorsController < ApplicationController
  # GET /vendors
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/1
  def show
    @vendor = Vendor.find_by(folio_id: params[:folio_id])
  end
end
