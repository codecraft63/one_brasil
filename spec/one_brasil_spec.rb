require 'spec_helper'

describe OneBrasil do
  describe "::configuration" do
    it "returns the same object every time" do
      expect(OneBrasil.configuration).to be_equal(OneBrasil.configuration)
    end
  end

  describe "::configure" do
    it "yields the current configuration" do
      OneBrasil.configure do |config|
        expect(config).to be_equal(OneBrasil::configuration)
      end
    end
  end
end