module RailsDb
  class TableData
    include Connection
    include TablePagination

    attr_reader :table, :time
    attr_accessor :current_page, :offset, :per_page, :sort_column, :sort_order

    delegate :each, :to => :data
    delegate :count, :to => :table

    def initialize(table)
      @table = table
    end

    def data
      @data ||= begin
        commands = ["SELECT * FROM #{table.name}"]
        if sort_column
          commands.push("ORDER BY #{sort_column} #{sort_order}")
        end
        commands.push("LIMIT #{per_page} OFFSET #{offset}")
        executor = SqlExecutor.new(commands.join(' '))
        results, @time = executor.execute
        results
      end
    end

    def count
      connection.exec_query("SELECT COUNT(*) FROM #{table.name}").rows.flatten.last.to_i
    end

  end
end