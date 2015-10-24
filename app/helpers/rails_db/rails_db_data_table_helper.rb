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

    def rails_db_data_table(options)
      table_name = options[:table]
      options.reverse_merge!(
        style: :default,
        header: true,
        footer: false,
        columns: [],
        limit: nil,
        order: nil
      )
      table      = RailsDb::Table.new(table_name)
        .limit(options[:limit])
        .order_by(:id)
        .select(options[:columns])
        .desc

      render '/rails_db/shared/data_table', table: table,
                                            header: options[:header],
                                            footer: options[:footer],
                                            style:  options[:style]
    end

    def rails_db_data_sql(options)
      sql        = "#{options[:sql]}".strip
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