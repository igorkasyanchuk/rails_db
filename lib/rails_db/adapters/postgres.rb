module RailsDb
  module Adapters

    class Postgres < BaseAdapter

      def self.adapter_name
        'postgres'
      end

    end

  end
end