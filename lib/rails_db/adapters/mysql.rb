module RailsDb
  module Adapters

    class Mysql < BaseAdapter

      def self.execute(sql)
        sql.split(";\n").each do |statement|
          connection.execute(statement)
        end
      end

      def self.adapter_name
        'mysql'
      end

    end

  end
end