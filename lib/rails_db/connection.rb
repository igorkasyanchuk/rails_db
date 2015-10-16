module RailsDb
  module Connection

    def connection
      ActiveRecord::Base.connection
    end

  end
end