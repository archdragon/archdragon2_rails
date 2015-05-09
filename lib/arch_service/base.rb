module ArchService
  class Base
    def self.call!(args)
      ActiveRecord::Base.transaction { body(args) }
    end

    def self.call(args)
      call!(args)
    rescue ArchService::Error => e
      respond(message: e.message)
    end

    def self.body(args)
      fail "self.body not found! You need to define a self.body method on your Service Object."
    end

    def self.respond(args)
      ArchService::Response.new(args)
    end

    def self.fail(args)
      raise ArchService::Error.new(args)
    end
  end
end
