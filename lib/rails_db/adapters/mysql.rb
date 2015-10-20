module RailsDb
  module Adapters

    class Mysql < BaseAdapter

      def self.execute(sql)
        sql.split(";\n").each do |statement|
          connection.execute(statement)
        end
      end

    end

  end
end