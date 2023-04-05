require "rails_helper"

RSpec.describe VendorsController do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/vendors").to route_to("vendors#index")
    end

    it "routes to #show" do
      expect(get: "/vendors/1").to route_to("vendors#show", id: "1")
    end

    it "does not route to #edit" do
      expect(get: "/vendors/1/edit").not_to be_routable
    end

    it "does not route to #create" do
      expect(post: "/vendors").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(put: "/vendors/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(patch: "/vendors/1").not_to be_routable
    end

    it "does not route to #destroy" do
      expect(delete: "/vendors/1").not_to be_routable
    end
  end
end
