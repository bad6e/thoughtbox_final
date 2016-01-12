require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do
  before(:each) do
    @link_one   = Link.create(title: "CNN",
                              link: "http://www.cnn.com/")
  end

  describe "GET /api/v1/links/" do

    it "gets a link on the link list" do
      get :index ,format: :json
      expect(response_data.first['title']).to eq(@link_one.title)
    end

    it "gets all the links on the link list" do
      get :index ,format: :json
      expect(response_data.count).to eq(1)
    end
  end

  describe "PUT /api/v1/links/:id" do

    it "updates a link on the link list" do
      put :update, format: :json, id: @link_one.id, link: { read_status: true }
      assert_response :success

      link_status = Link.find(@link_one.id).read_status
      expect(link_status).to eq(true)
    end

    it "updates the same link to false" do
      put :update, format: :json, id: @link_one.id, link: { read_status: false }
      assert_response :success

      link_status = Link.find(@link_one.id).read_status
      expect(link_status).to eq(false)
    end
  end
end

