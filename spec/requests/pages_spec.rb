require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /:slug" do
    it "has proper headline" do
      page = create(:page, title: "Edna O'Brien96")
      get "/page/#{page.slug}"
      expect(response.body).to include(CGI.escapeHTML(page.title))
    end
  end

  describe "GET /about" do
    it "has proper headline" do
      get "/about"
      expect(response.body).to include("About dev.to")
    end
  end

  describe "GET /api" do
    it "has proper headline" do
      get "/api"
      expect(response.body).to include("DEV Articles API")
    end
  end

  describe "GET /privacy" do
    it "has proper headline" do
      get "/privacy"
      expect(response.body).to include("Privacy Policy")
    end
  end

  describe "GET /terms" do
    it "has proper headline" do
      get "/terms"
      expect(response.body).to include("Web Site Terms and Conditions of Use")
    end
  end

  describe "GET /security" do
    it "has proper headline" do
      get "/security"
      expect(response.body).to include("Reporting Vulnerabilities to dev.to")
    end
  end

  describe "GET /code-of-conduct" do
    it "has proper headline" do
      get "/code-of-conduct"
      expect(response.body).to include("Code of Conduct")
    end
  end

  describe "GET /rly" do
    it "has proper headline" do
      get "/rly"
      expect(response.body).to include("O RLY Cover Generator")
    end
  end

  describe "GET /sponsorship-info" do
    it "has proper headline" do
      get "/sponsorship-info"
      expect(response.body).to include("Sponsorship Information")
    end
  end

  describe "GET /welcome" do
    it "has proper headline" do
      get "/welcome"

      expect(response.body).to include("You are being <a")
    end
  end

  describe "GET /badge" do
    it "has proper headline" do
      html_variant = create(:html_variant, group: "badge_landing_page", published: true, approved: true)
      get "/badge"
      expect(response.body).to include(html_variant.html)
    end
  end

  describe "GET /live" do
    context "when nothing is live" do
      it "shows the correct message" do
        get "/live"
        expect(response.body).to include("We are working on more ways to bring live coding to the community")
      end
    end
  end
end
