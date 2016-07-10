require 'rails_helper'

RSpec.describe "Visitations", type: :request do
  describe "GET /visitations" do
    let(:visitor) {
      FactoryGirl.create(:visitor)
    }

    it "works! (now write some real specs)" do
      FactoryGirl.create(:visitation, visitor_id: visitor.id)

      get visitor_visitations_path(visitor.id)
      expect(response).to have_http_status(200)
    end
  end
end
