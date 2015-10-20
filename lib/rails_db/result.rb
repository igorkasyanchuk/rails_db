module RailsDb
  class Result

    attr_reader :error

    def initialize(error)
      @error = error
    end

    def self.ok
      Result.new(nil)
    end

    def ok?
      error.nil?
    end

  end
end