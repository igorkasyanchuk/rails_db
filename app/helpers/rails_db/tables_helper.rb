module RailsDb
  module TablesHelper

    def format_value(column, value)
      return value
      # TODO here
      return nil unless value
      case column.type
      when :datetime
        I18n.l(DateTime.parse(value), format: :long)
      when :date
        I18n.l(Date.parse(value), format: :long)
      else
        value
      end
    end

    def titleize_column(column, title = nil)
      column
    end

    def select_top_from_table(table)
      link_to raw("#{fa_icon('database')} SQL Query"), rails_db.sql_path(sql: "select * from #{table} limit 10")
    end

    def delete_row_path(table, record)
      options = params.permit!
      table_destroy_path(table,
        pk_id: record[table.primary_key],
        page: options[:page],
        q: options[:q])
    end

    def table_pagination_path
      params.delete(:pk_id)
      params_to_hash params.merge({action: :data})
    end

    def column_is_checked?(table_name, column_name)
      if cookies["Table: #{table_name}"].present?
        !cookies["Table: #{table_name}"].split(',').include?(column_name)
      else
        true
      end
    end

    def display_style_column(table_name, column_name)
      column_is_checked?(table_name, column_name) ? 'display' : 'display:none'
    end

    def search_form_class
      hash = params.permit!.to_hash.fetch('q', {})
      keys = hash.keys
      return 'hide' if keys.empty?
      return 'hide' if keys == ['s']
      nil
    end

  end
end
