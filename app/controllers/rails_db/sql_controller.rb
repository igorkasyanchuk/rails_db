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

  end
end