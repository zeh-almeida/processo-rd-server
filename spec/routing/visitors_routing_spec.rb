require "rails_helper"

RSpec.describe VisitorsController, type: :routing do
  describe "routing" do
    let(:visitor) { FactoryGirl.create(:visitor) }

    it "routes to #index" do
      expect(get: "/visitors").to route_to("visitors#index")
    end

    it "routes to #show" do
      expect(get: "/visitors/#{visitor.id}").to route_to("visitors#show", id: visitor.id)
    end

    it "routes to #create" do
      expect(post: "/visitors").to route_to("visitors#create")
    end
  end
end
