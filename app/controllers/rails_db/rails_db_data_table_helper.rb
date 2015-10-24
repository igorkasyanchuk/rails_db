module RailsDb
  module RailsDbDataTableHelper

    def rails_db_data_table(options)
      table_name = options[:table]
      columns    = Array.wrap(options[:columns])
      table      = RailsDb::Table.new(table_name)
      columns    = columns.any? ? columns : table.column_names
      render '/rails_db/shared/data_table', table: table,
                                            header: options[:header],
                                            footer: options[:footer],
                                            columns: columns
    end

    def rails_db_data_sql(options)
      sql        = "#{options[:sql]}".strip
      sql_query  = RailsDb::SqlQuery.new(sql).execute
      render '/rails_db/shared/sql_result', sql_query: sql_query,
                                            header: options[:header],
                                            footer: options[:footer]
    end

  end
end