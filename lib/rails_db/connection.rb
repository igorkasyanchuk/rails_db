module RailsDb
  module Connection

    def connection
      RailsDb.abstract_model_class.connection
    rescue ActiveRecord::ConnectionNotEstablished
      RailsDb.abstract_model_class.establish_connection(Rails.application.config.database_configuration[Rails.env]).connection
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
