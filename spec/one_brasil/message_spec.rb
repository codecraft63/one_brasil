require 'spec_helper'

module OneBrasil
  
  describe Message do 

    describe "#valid?" do
      let(:message) { described_class.new('7112345678', "text") }

      it do
        described_class.any_instance.should_receive(:check_number!).and_return(true)
        message.valid?
      end

      it do
        described_class.any_instance.should_receive(:check_body!).and_return(true)
        message.valid?
      end
    end

    context 'with valid data, must be valid if' do
      it "have 10 digits" do
        message = described_class.new('7112345678', 'text')
        message.should be_valid
      end

      it "can have 11 for specific DDD" do
        message = described_class.new('11123456789', 'text')
        message.should be_valid
      end
    end

    context 'with invalid data' do
      it "raise unknown ddd code" do
        message = described_class.new("0012345678", "text")
        expect { message.valid? }.to raise_error("Unknown DDD code (00)")
      end

      it "raise wrong number size" do
        message = described_class.new("11123458", "text")
        expect { message.valid? }.to raise_error("Wrong phone number size")
      end

      it "raise wrong number size for nine digit ddd" do
        message = described_class.new("21123456789", "text")
        expect { message.valid? }.to raise_error("Wrong phone number size")
      end

      it "raise message too long" do
        message = described_class.new("2112345678", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        expect { message.valid? }.to raise_error("Message too long")
      end
    end
  end
end
