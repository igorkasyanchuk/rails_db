require 'csv'

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

    def column_names
      columns.collect(&:name)
    end

    def to_csv
      CSV.generate do |csv|
        csv << column_names
        data.data.rows.each do |row|
          csv << row
        end
      end
    end

  end # module

end