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
end
