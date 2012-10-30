require "one_brasil/version"

module OneBrasil
  autoload :Configuration,  'one_brasil/configuration'
  autoload :SMS,            'one_brasil/sms'
  autoload :Message,        'one_brasil/message'
  
  # Default way to config OneBrasil
  def self.configuration
    @configuration ||= OneBrasil::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end
end
