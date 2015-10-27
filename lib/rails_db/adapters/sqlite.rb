module RailsDb
  module Adapters

    class Sqlite < BaseAdapter

      def self.execute(sql)
        t0 = Time.now
        multiple_execute(sql)
        Time.now - t0
      end

      def self.adapter_name
        'sqlite'
      end

      def self.truncate(table_name)
        execute("DELETE FROM #{table_name};")
      end

    end

  end
end