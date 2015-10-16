module RailsDb

  class Table
    include Connection

    attr_reader :name, :data

    delegate :count, :to => :data
    delegate :paginate, :to => :data

    def initialize(table_name)
      @name = table_name
      @data = RailsDb::TableData.new(self)
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

  end

end