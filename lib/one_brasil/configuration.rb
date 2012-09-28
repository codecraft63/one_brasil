module OneBrasil
  class Configuration
    # Username is the client login.
    attr_accessor :username

    # Password to the username authentication.
    attr_accessor :password

    # API URL
    attr_accessor :api_url
    @api_url = "http://sms.onebrasilmidia.com.br/"
  end
end