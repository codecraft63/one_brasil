require 'spec_helper'

module OneBrasil
  describe SMS do
    let(:config) { mock("configuration").as_null_object }

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
        described_class.new
      end
    end

    describe "#send" do
      before do
        OneBrasil.stub(:configuration).and_return(config)

        @message = mock('message')
        @message.stub(:phone_number).and_return("123")
        @message.stub(:body).and_return("text")
        @message.stub(:valid?).and_return(true)
      end

      it "with valid number and text" do
        subject.stub(:execute).and_return(200)
        expect(subject.send(@message)).to be_true
      end

      it "throw error with invalid credentials" do
        subject.stub(:execute).and_return(403)
        expect { subject.send(@message) }.to raise_error(AuthException)
      end

      it "throw error with bad request" do
        subject.stub(:execute).and_return(400)
        expect { subject.send(@message) }.to raise_error(BadRequestException)
      end
 

    end
  end
end
