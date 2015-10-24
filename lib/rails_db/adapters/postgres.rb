module RailsDb
  module Adapters

    class Postgres < BaseAdapter

      def self.adapter_name
        'postgres'
      end

      def self.mime
        'text/x-plsql'
      end

    end

  end
end