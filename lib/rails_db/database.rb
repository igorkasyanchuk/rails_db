module RailsDb
  class Database
    include Connection
    extend Connection

    def self.tables
      connection.tables.sort - ['schema_migrations']
    end

    def self.accessible_tables
      tables = Database.tables
      if Array.wrap(RailsDb.white_list_tables) != []
        tables = tables & RailsDb.white_list_tables
      end
      if Array.wrap(RailsDb.black_list_tables) != []
        tables = tables - RailsDb.black_list_tables
      end
      tables
    end

    def self.adapter
      case connection.class.to_s
      when /Mysql/
        RailsDb::Adapters::Mysql
      when /Postgre/
        RailsDb::Adapters::Postgres
      when /SQLite/
        RailsDb::Adapters::Sqlite
      else
        RailsDb::Adapters::BaseAdapter
      end
    end

  end
end