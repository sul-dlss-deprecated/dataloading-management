require "rails_helper"

RSpec.describe "Data Loading Management", type: :request do
  describe "/" do
    context "with an unauthenticated user" do
      before { sign_out }

      it "renders the stats index page" do
        get "/"
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "with an authenticated user" do
      let(:user) { create(:user) }

      before { sign_in user }

      it "renders the stats index page" do
        get "/"
        expect(response).to have_http_status(:ok)
        expect(response.body).to match(/Data Loading Management Statistics/)
        expect(response.body).to match(/Status/)
        expect(response.body).to match(/Vendors/)
        expect(response.body).to match(/Schedule/)
      end
    end
  end
end
