require 'spec_helper'

describe OneBrasil::Configuration do
  let(:config) { OneBrasil::Configuration.new }

  describe "#username=" do
    it "sets the username" do
      username = "one_brasil"
      config.username = username
      expect(config.username).to be_equal(username)
    end
  end

  describe "#password=" do
    it "sets the password" do
      password = "one_brasil"
      config.password = password
      expect(config.password).to be_equal(password)
    end
  end

  describe "#api_url=" do
    it "sets the api_url" do
      api_url = "one_brasil"
      config.api_url = api_url
      expect(config.api_url).to be_equal(api_url)
    end
  end
end
