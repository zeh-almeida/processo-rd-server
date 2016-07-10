require "rails_helper"

RSpec.describe VisitationsController, type: :routing do
  describe "routing" do
    let(:visitor) {FactoryGirl.create(:visitor)}

    it "routes to #index" do
      expect(get: "/visitors/#{visitor.id}/visitations").to route_to("visitations#index", visitor_id: visitor.id)
    end
  end
end
