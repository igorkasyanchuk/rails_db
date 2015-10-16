module RailsDb
  class SqlQuery
    include Connection

    attr_reader :query, :data, :explain

    def initialize(query)
      @query = query
    end

    def valid?
      query.present?
    end

    def load_explain
      @explain ||= SqlExplain.new(self).load_data
    end

    def load_data
      @data ||= SqlQueryData.new(self).load_data
    end

    def execute
      if valid?
        load_data
        load_explain
        History.add(query)
      end
      self
    end

  end
end