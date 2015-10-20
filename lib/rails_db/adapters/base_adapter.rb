module RailsDb
  module Adapters

    class BaseAdapter
      extend ::RailsDb::Connection

      MULTI_STATEMENT_HELP_TEXT = "You can import only file with SQL statements separated by ';'. Each new statement must start from new line."

      def self.execute(sql)
        connection.execute(sql)
      end

      def self.exec_query(sql, log = true)
        t0 = Time.now
        Rails.logger.debug "--> Executing: #{sql}" if log
        results = connection.exec_query(sql)
        execution_time = Time.now - t0
        [results, execution_time]
      end

    end

  end
end