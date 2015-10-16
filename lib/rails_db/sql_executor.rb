module RailsDb
  class SqlExecutor
    include Connection

    attr_reader :query

    def initialize(query)
      @query = query
    end

    def execute
      t0 = Time.now
      Rails.logger.debug "--> Executing: #{query}"
      results = connection.exec_query(query)
      execution_time = Time.now - t0
      [results, execution_time]
    end

  end
end