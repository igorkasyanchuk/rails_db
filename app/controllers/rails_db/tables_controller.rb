module RailsDb
  class TablesController < RailsDb::ApplicationController

    def index
      @tables = RailsDb::Database.accessible_tables
    end

    def show
      @table = RailsDb::Table.new(params[:id])
    end

    def data
      per_page = params[:per_page] || session[:per_page]
      session[:per_page] = per_page
      @table   = RailsDb::Table.new(params[:table_id]).paginate :page => params[:page],
                                                                :sort_column => params[:sort_column],
                                                                :sort_order => params[:sort_order],
                                                                :per_page => per_page
    end

    def csv
      @table = RailsDb::Table.new(params[:table_id])
      send_data(@table.to_csv, type: 'text/csv; charset=utf-8; header=present', filename: "#{@table.name}.csv")
    end
  end
end