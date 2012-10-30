require 'uri'
require 'net/http'

module OneBrasil
  class SMS
    @base_url = "http://sms.onebrasilmidia.com.br/"

    def initialize
      @base_url = OneBrasil.configuration.api_url
      @username, @password = OneBrasil.configuration.username, OneBrasil.configuration.password
    end    

    def send(to, text)
      raise SMSNumberException unless valid_number?(to)
      raise SMSTextLengthException unless valid_text_size?(text)

      case execute({ to: to, text: text})
      when 200
        true
      when 403
        raise SMSAuthException
      when 400
        raise SMSBadRequest
      end
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
end