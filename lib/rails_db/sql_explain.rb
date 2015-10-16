module RailsDb
  class SqlExplain
    include Connection

    attr_accessor :sql_query

    delegate :each,       :to => :load
    delegate :is_error?,  :to => :data
    delegate :count,      :to => :data
    delegate :columns,    :to => :data
    delegate :rows,       :to => :data

    def initialize(sql_query)
      @sql_query = sql_query
    end

    def load
      connection.exec_query("EXPLAIN #{sql_query.query}")
    end

    def data
      @data ||= SqlQueryData.new(self)
    end

  end
end