module RailsDb
  class SqlController < RailsDb::ApplicationController

    def index
      @sql = "#{params[:sql]}".strip
      if @sql.present?
        @query = RailsDb::SqlQuery.new(@sql)
      end
    end

    def execute
      @sql = "#{params[:sql]}".strip
      @query = RailsDb::SqlQuery.new(@sql)
      binding.pry
      render :index
    end

  end
end