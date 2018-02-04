module RailsDb
  class SqlController < RailsDb::ApplicationController
    before_action :load_query, only: [:index, :execute, :csv, :xls]

    def index
    end

    def execute
      render :index
    end

    def csv
      send_data(@sql_query.to_csv, type: 'text/csv; charset=utf-8; header=present', filename: 'results.csv')
    end

    def xls
      render xlsx: 'xls', filename: 'results.xlsx'
    end

    def import
    end

    def import_start
      @importer = SqlImport.new(params[:file])
      result    = @importer.import
      if result.ok?
        flash[:notice] = 'File was successfully imported'
      else
        flash[:alert] = "Error occurred during import: #{result.error.message}"
      end
      render :import
    end

    private

    def load_query
      @sql       = "#{params[:sql]}".strip
      @sql_query = RailsDb::SqlQuery.new(@sql).execute
    end

  end
end