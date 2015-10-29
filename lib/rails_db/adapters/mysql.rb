module RailsDb
  module Adapters

    class Mysql < BaseAdapter

      def self.execute(sql)
        t0 = Time.now
        multiple_execute(sql)
        Time.now - t0
      end

      def self.exec_query(sql, log = true)
        t0      = Time.now
        results = connection.execute(sql, 'SQL') # used from RoR mysql adapter source
        result  = MysqlResult.new(results)
        execution_time = Time.now - t0
        [result, execution_time]
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