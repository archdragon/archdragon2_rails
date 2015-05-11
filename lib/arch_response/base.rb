module ArchResponse
  class Base 
    attr_reader :message

    def initialize(message: "")
      @message = message
    end

    def success?
      false
    end

    def flash
      flash_type = :notice if success?
      flash_type ||= :error

      flash = { flash_type => @message }
    end
  end
end

