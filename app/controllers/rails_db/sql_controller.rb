module RailsDb
  class SqlController < RailsDb::ApplicationController

    def index
      @sql = "#{params[:sql]}".strip
      @sql_query = RailsDb::SqlQuery.new(@sql).execute
    end

    def execute
      @sql = "#{params[:sql]}".strip
      @sql_query = RailsDb::SqlQuery.new(@sql).execute
      render :index
    end

    def csv
      @sql = "#{params[:sql]}".strip
      @sql_query = RailsDb::SqlQuery.new(@sql).execute
      send_data(@sql_query.to_csv, :type => 'text/csv; charset=utf-8; header=present', :filename => "results.csv")
    end

  end
end