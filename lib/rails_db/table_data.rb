module RailsDb
  class TableData
    include Connection
    include TablePagination

    attr_reader :table, :time
    attr_accessor :current_page, :offset, :per_page, :sort_column, :sort_order, :select_columns

    delegate :each,  to: :data
    delegate :count, to: :table

    def initialize(table)
      @table = table
    end

    def data
      @data ||= begin
        commands = []
        if select_columns && select_columns.any?
          commands.push("SELECT #{select_columns.join(', ')} FROM #{table.name}")
        else
          commands.push("SELECT * FROM #{table.name}")
        end
        if sort_column
          commands.push("ORDER BY #{sort_column} #{sort_order}")
        end
        if per_page
          commands.push("LIMIT #{per_page.to_i} OFFSET #{offset.to_i}")
        end
        results, @time = Database.select(commands.join(' '))
        results
      end
    end

    def limit(limit)
      self.per_page = limit
      self
    end

    def desc
      self.sort_order = 'desc'
      self
    end

    def asc
      self.sort_order = 'asc'
      self
    end

    def order_by(column)
      self.sort_column = column
      self
    end

    def order(sort_order)
      self.send(sort_order) if [:asc, :desc].include?(sort_order.to_sym)
      self
    end

    def select(*select_columns)
      self.select_columns = Array.wrap(select_columns).flatten
      self
    end

    def columns
      if select_columns && select_columns.any?
        select_columns
      else
        table.column_names
      end
    end

    def count
      Database.count(table.name)
    end

  end
end