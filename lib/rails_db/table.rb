module RailsDb

  class Table

    attr_reader :name

    def initialize(table_name)
      @name = table_name
    end

    def columns
      connection.columns(name)
    end

    def column_properties
      %w(name sql_type null limit precision scale type default)
    end

    def to_param
      name
    end

    def data
      RailsDb::TableData.new(self)
    end

    def count
      connection.exec_query("SELECT COUNT(*) FROM #{@name}").rows.flatten.last.to_i
    end

  end

end