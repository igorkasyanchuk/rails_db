module RailsDb
  class SqlQueryData

    attr_reader :sql_query, :time, :columns, :rows, :error

    def initialize(sql_query)
      @rows    = []
      @columns = []
      @sql_query = sql_query
    end

    def load_data
      result, @time = Database.adapter.exec_query(sql)
      @columns      = result.columns
      @rows         = result.rows
      self
    rescue ActiveRecord::StatementInvalid => e
      @columns, @rows = [], []
      @error = e
      self
    end

    def count
      rows.count
    end

    def is_error?
      error.present?
    end

    def sql
      sql_query.query
    end

  end
end