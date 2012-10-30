require 'uri'
require 'net/http'

module OneBrasil
  class SMS
    def initialize
      @base_url = OneBrasil.configuration.api_url
      @username, @password = OneBrasil.configuration.username, OneBrasil.configuration.password
    end

    def send(message)
      case execute({ to: message.phone_number, text: message.body })
      when 200
        true
      when 403
        raise AuthException
      when 400
        raise BadRequestException
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

  class AuthException < Exception
  end

  class BadRequestException < Exception
  end
end

