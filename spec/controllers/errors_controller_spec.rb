require "rails_helper"

describe ErrorsController, type: :controller do
  describe "#forbidden" do
    it "receives a success status for the forbidden page" do
      get :forbidden
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "#internal_server_error" do
    it "receives a success status for the internal_server_error page" do
      get :internal_server_error
      expect(response).to have_http_status(:internal_server_error)
    end
  end

  describe "#not_found" do
    it "receives a success status for the not_found page" do
      get :not_found
      expect(response).to have_http_status(:not_found)
    end
  end
end
