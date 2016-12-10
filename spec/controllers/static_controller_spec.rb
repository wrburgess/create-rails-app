require "rails_helper"

describe StaticController, type: :controller do
  describe "#about" do
    it "receives a success status for the about page" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "#contact" do
    it "receives a success status for the contact page" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "#home" do
    it "receives a success status for the home page" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "#robots" do
    it "receives a success status for the robots page" do
      get :robots, format: :txt
      expect(response).to have_http_status(:success)
    end
  end

  # TODO: This is an example spec and can be deleted later
  describe "#secure" do
    let(:user) { FactoryGirl.create :user }

    it "receives a failure status for if the user is not authorized page" do
      get :secure
      expect(response).to redirect_to root_path
    end

    it "receives a success status for the robots page" do
      sign_in user
      get :secure
      expect(response).to have_http_status(:success)
    end
  end
end
