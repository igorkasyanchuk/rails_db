module RailsDb
  class SqlQuery
    include Connection

    attr_reader :query, :data, :explain, :sql_explain

    def initialize(query, sql_explain = true)
      @query       = query
      @sql_explain = sql_explain
    end

    def valid?
      query.present?
    end

    def load_explain
      @explain ||= SqlExplain.new(self).load_data
    end

    def load_data
      @data    ||= SqlQueryData.new(self).load_data
    end

    def execute
      if valid?
        load_data
        load_explain if sql_explain
        History.add(query)
      end
      self
    end

    def to_csv
      CSV.generate do |csv|
        csv << data.columns
        data.rows.each do |row|
          csv << row
        end
      end
    end

  end
end