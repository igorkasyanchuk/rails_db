module RailsDb
  class TablesController < RailsDb::ApplicationController

    def index
      @tables = ActiveRecord::Base.connection.tables.sort
    end

    def show
      @table = RailsDb::Table.new(params[:id])
    end

    def data
      @table   = RailsDb::Table.new(params[:table_id])
      @entries = @table.data.paginate :page => params[:page],
                                      :sort_column => params[:sort_column],
                                      :sort_order => params[:sort_order],
                                      :per_page => params[:per_page]
    end

  end
end