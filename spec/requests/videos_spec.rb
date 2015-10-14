require 'rails_helper'

RSpec.describe "Videos", type: :request do
  describe "GET /videos" do
    it "works! (now write some real specs)" do
      get videos_path
      expect(response).to have_http_status(200)
    end

    it "returns the right count of videos" do
    	get videos_path
    	json = JSON.parse(response.body)
    	expect(json["videos"].length).to eq(Video.all.count)
    end
  end
end
