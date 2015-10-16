module RailsDb
  class SqlQuery
    include Connection

    attr_accessor :query
    attr_accessor :current_page, :offset, :per_page, :sort_column, :sort_order

    delegate :each,       :to => :load
    delegate :is_error?,  :to => :data
    delegate :count,      :to => :data
    delegate :columns,    :to => :data
    delegate :rows,       :to => :data

    def initialize(query)
      @query = query
    end

    def load
      connection.exec_query(query)
    end

    def explain
      @explain ||= SqlExplain.new(self)
    end

    def data
      @data ||= SqlQueryData.new(self)
    end

  end
end