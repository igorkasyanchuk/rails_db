module RailsDb
  module Adapters

    class Mysql < BaseAdapter

      def self.execute(sql)
        t0 = Time.now
        multiple_execute(sql)
        Time.now - t0
      end

      def self.adapter_name
        'mysql'
      end

      def self.mime
        'text/x-mysql'
      end

    end

  end
end