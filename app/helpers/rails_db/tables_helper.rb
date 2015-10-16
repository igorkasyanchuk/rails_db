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

    def sortable(column, title = nil)
      title = titleize_column(column, title)
      css_class  = (column == params[:sort_column]) ? "current #{params[:sort_order]}" : nil
      sort_order = (column == params[:sort_column] && params[:sort_order] == "asc") ? "desc" : "asc"
      link_to title, params.merge({:sort_column => column, :sort_order => sort_order}), { :class => css_class }
    end

    def titleize_column(column, title = nil)
      column
    end

    def select_top_from_table(table)
      link_to raw("#{fa_icon('database')} SQL Query"), rails_db.sql_path(sql: "select * from #{table} limit 10")
    end

  end
end
