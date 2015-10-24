module RailsDb
  module Connection

    def connection
      ActiveRecord::Base.connection
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

  end
end