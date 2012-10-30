require 'uri'
require 'net/http'

module OneBrasil
  class SMS
    def initialize
      @base_url = OneBrasil.configuration.api_url
      @username, @password = OneBrasil.configuration.username, OneBrasil.configuration.password
    end    

    def send(message)
      case execute({ to: phone_number, text: message})
      when 200
        true
      when 403
        raise SMSAuthException
      when 400
        raise SMSBadRequest
      end
    end

    def check_number(number)
      raise ArgumentError, "Must be integer" unless number.is_a? Fixnum
      raise PhoneNumberError, "Unknown DDD code" unless DDD.include?(number.to_s[0...2])

      true
    end

    def valid_text_size?(text)
      text.size <= 140
    end

  private
    def execute(params)
      params.merge!({ username: @username, password: @password })
      uri = URI(@base_url)
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      res.code
    end
  end

  class PhoneNumberError < Exception
  end

  class MessageError < Exception
  end

end
