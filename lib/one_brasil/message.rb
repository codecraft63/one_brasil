module OneBrasil
  class Message
    DDD = %w(11 12 13 14 15 16 17 18 19 21 22 24 27 28 
             31 32 33 34 35 37 38 41 42 43 44 45 46 47 
             48 49 51 53 54 55 61 62 63 64 65 66 67 68 
             69 71 73 74 75 77 79 81 82 83 84 85 86 87 
             88 89 91 92 93 94 95 96 97 98 99)

    NINE_DIGITS_DDD = %w(11)

    def initialize(phone_number, body)
      @phone_number, @body = phone_number.to_s, body
    end

    def valid?
      check_number!
      check_body!
      true
    end


  private
    def check_number!
      ddd, number = @phone_number[0..1], @phone_number[2..-1]

      raise MessageException, "Unknown DDD code (#{ddd})" unless DDD.include?(ddd)

      if NINE_DIGITS_DDD.include?(ddd)
        raise MessageException, "Wrong phone number size" unless [8, 9].include?(number.size)
      else
        raise MessageException, "Wrong phone number size" unless number.size == 8 
      end
    end

    def check_body!
      raise MessageException, "Message too long" unless @body.size <= 140
    end
  end


  class MessageException < Exception
  end
end

