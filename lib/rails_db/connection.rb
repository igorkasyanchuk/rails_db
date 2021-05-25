module RailsDb
  module Connection

    def connection
      ActiveRecord::Base.connection
    rescue ActiveRecord::ConnectionNotEstablished
      ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[Rails.env])

      if RailsDb.sandbox
        ActiveRecord::Base.connection.execute("SET SESSION CHARACTERISTICS AS TRANSACTION READ ONLY")
      end

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
