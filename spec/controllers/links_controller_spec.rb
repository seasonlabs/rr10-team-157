require 'spec_helper'

describe LinksController do
  describe 'GET index' do
    it "should request index page and return 200" do
      get :index
      response.code.should eq(200)
    end
  end
end