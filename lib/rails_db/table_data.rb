module RailsDb
  class TableData
    include Connection
    include TablePagination

    attr_reader :table
    attr_accessor :current_page, :offset, :per_page, :sort_column, :sort_order

    delegate :each, :to => :load
    delegate :count, :to => :table

    def initialize(table)
      @table = table
    end

    def load
      commands = ["SELECT * FROM #{table.name}"]
      if sort_column
        commands.push("ORDER BY #{sort_column} #{sort_order}")
      end
      commands.push("LIMIT #{per_page} OFFSET #{offset}")
      connection.exec_query(commands.join(' '))
    end

  end
end