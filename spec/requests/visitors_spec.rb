require 'rails_helper'

RSpec.describe "Visitors", type: :request do
  describe "GET /visitors" do

    it "renders #index" do
      FactoryGirl.create(:visitor)

      get visitors_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /visitors/:id" do
    let(:visitor) {
      FactoryGirl.create(:visitor)
    }

    it "renders #show" do
      get visitor_path(visitor)
      expect(response).to have_http_status(200)
    end
  end
end
