require 'spec_helper'

describe OneBrasil::SMS do
  let(:config) { mock("configuration").as_null_object }
  let (:sms) { OneBrasil::SMS.new }

  describe "initialize" do
    before do
      config.stub(:username).and_return("username")
      config.stub(:password).and_return("password")
      config.stub(:api_url).and_return("api_url")
      OneBrasil.stub(:configuration).and_return(config)
    end

    it 'set base_url, username and password variables' do
      config.should_receive(:api_url)
      config.should_receive(:username)
      config.should_receive(:password)
      OneBrasil::SMS.new
    end
  end

  describe "#send" do
    before { OneBrasil.stub(:configuration).and_return(config) }

    context "with valid data" do
    end
  end

  describe "#check_number" do 
    it "must be a integer" do
      expect(sms.check_number(7112345678)).to be_true
      expect(sms.check_number("onebrasil")).to raise_error(ArgumentError, "Must be integer")
    end

    it "must starts with a valid DDD" do
      expect(sms.check_number(7112345678)).to be_true
      expect(sms.check_number(1012345678)).to raise_error(OneBrasil::PhoneNumberError, "Unknown DDD code")
    end

    it "must have 10 characters" do
      expect(sms.check_number(7112345678)).to be_true
      expect(sms.check_number(711234567)).not_to be_true
    end

    context "DDD 11"
    it "must have 11 characters" do
      expect(sms.check_number(11123456789)).to be_true
      expect(sms.check_number(1112345678)).not_to be_true
    end
  end
end