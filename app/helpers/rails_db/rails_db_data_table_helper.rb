module RailsDb
  module RailsDbDataTableHelper
    # TODO check styles
    STYLES = {
      default: {
        table: 'table',
        tr: 'table_tr',
        th: 'table_th',
        td: 'table_td',
        thead: 'table_thead',
        tfoot: 'table_tfoot'
      },
      bootstrap: {
        table: 'table table-bordered table-striped table-hover',
        tr: 'table_tr',
        th: 'table_th',
        td: 'table_td',
        thead: 'table_thead',
        tfoot: 'table_tfoot'
      },
      foundation: {
        table: 'table',
        tr: 'table_tr',
        th: 'table_th',
        td: 'table_td',
        thead: 'table_thead',
        tfoot: 'table_tfoot'
      }
    }

    def rails_db_data_table(table_name, options = {})
      options.reverse_merge!(
        style: :default,
        header: true,
        footer: false,
        columns: [],
        limit: nil,
        order_by: nil,
        order: :asc
      )
      table = RailsDb::Table.new(table_name)
        .limit(options[:limit])
        .order_by(options[:order_by])
        .select(options[:columns])
        .order(options[:order])

      render '/rails_db/shared/data_table', table: table,
                                            header: options[:header],
                                            footer: options[:footer],
                                            style:  options[:style]
    end

    def rails_db_data_table_sql(sql, options = {})
      options.reverse_merge!(
        style: :default,
        header: true,
        footer: false,
      )
      sql        = "#{sql}".strip
      sql_query  = RailsDb::SqlQuery.new(sql, false).execute

      render '/rails_db/shared/sql_result', sql_query: sql_query,
                                            header: options[:header],
                                            footer: options[:footer],
                                            style:  options[:style]
    end

    def rails_db_table_style(tag, style)
      style = STYLES[style] || STYLES[:default]
      style[tag.to_sym]
    end

  end
end