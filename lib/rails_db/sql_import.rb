module RailsDb
  class SqlImport
    include Connection

    attr_reader :time

    def initialize(file)
      @file = file
    end

    def valid?
      if @file.nil?
        raise RailsDbError.new('Please select valid SQL file and continue')
      end
    end

    def import
      valid?
      result, @time = Database.adapter.execute(@file.read)
      Result.ok
    rescue RailsDbError, ActiveRecord::StatementInvalid => e
      Result.new(e)
    end

  end
end