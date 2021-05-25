module RailsDb
  module Adapters

    class Sqlite < BaseAdapter

      def self.execute(sql)
        t0 = Time.now
        execute_with_sandbox_if_needed do
          multiple_execute(sql)
        end
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
