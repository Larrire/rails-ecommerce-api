require 'rails_helper'

RSpec.describe "Admin::V1::Categories", type: :request do
  let(:user) { create(:user) }

  context "GET /categories" do
    let(:url) { "/admin/v1/categories" }
    # Using ! makes RSpec run instantly the command. 
    # We need it to make sure the 5 categories already exists at database when the request is made. 
    let!(:categories) { create_list(:category, 5) }

    it "returns all categories" do
      get url, headers: auth_header(user)
      # Using * makes the "expand" of and array, it's king of like a spread
      expect(body_json['categories']).to contain_exactly *categories.as_json(only: %i(id name))
    end

    it "return success status" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  end
end
