module RailsDb
  class SqlQueryData

    attr_accessor :columns
    attr_accessor :rows
    attr_accessor :error

    @rows    = []
    @columns = []

    def initialize(query)
      result    = query.load
      @columns  = result.columns
      @rows     = result.rows
    rescue ActiveRecord::StatementInvalid => e
      @columns, @rows = [], []
      @error = e
    end

    def count
      @rows.count
    end

    def is_error?
      @error.present?
    end

  end
end