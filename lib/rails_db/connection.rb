module RailsDb
  module Connection

    def connection
      if RailsDb.database_role.present?
        ActiveRecord::Base.connection_handler.retrieve_connection(ActiveRecord::Base.name, role: RailsDb.database_role)
      else
        ActiveRecord::Base.connection
      end
    rescue ActiveRecord::ConnectionNotEstablished
      ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[Rails.env]).connection
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
