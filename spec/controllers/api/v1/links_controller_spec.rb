require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do
  before(:each) do
    @link_one   = Link.create(title: "CNN",
                              link: "http://www.cnn.com/")

    # @idea_two   = Idea.create(title: "B",
    #                           body: "B1")

    # @idea_three = Idea.create(title: "C",
    #                           body: "C1")

    # @idea_four  = Idea.create(title: "D",
    #                           body: "D1")
  end

  describe "PUT /api/v1//:id" do

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

    # it "updates the quality of an idea on the list" do
    #   put :update, format: :json, id: @idea_one.id, idea: {quality: 'genius'}
    #   assert_response :success

    #   idea_title = Idea.find(@idea_one.id).quality
    #   expect(idea_title).to eq("genius")
    # end

    # it "rejects the quality of an idea if it is not on the list" do
    #   put :update, format: :json, id: @idea_one.id, idea: {quality: 'INVALID'}
    #   assert_response 422
    #   expect(response_data['quality']).to eq(["INVALID is a not a valid quality!"])
    # end

    # it "rejects an idea on the idea list with no title" do
    #   put :update, format: :json, id: @idea_one.id, idea: { title: "", body: "Mom" }
    #   assert_response 422

    #   expect(response_data['title']).to eq(["can't be blank"])
    # end

    # it "rejects an idea on the idea list with no body" do
    #   put :update, format: :json, id: @idea_one.id, idea: { title: "Hi", body: "" }
    #   assert_response 422

    #   expect(response_data['body']).to eq(["can't be blank"])
    # end
  end
end

