module RailsDb
  class MysqlResult

    attr_reader :columns, :rows

    delegate :each,  :to => :rows

    def initialize(result)
      @columns = []
      @rows    = []
      if result
        @columns = result.fields
        @rows    = result.entries
      end
    end

  end
end