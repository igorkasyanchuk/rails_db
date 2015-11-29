module RailsDb
  class TablesController < RailsDb::ApplicationController
    if Rails::VERSION::MAJOR >= 4
      before_action :find_table, only: [:show, :data, :csv, :truncate, :destroy, :edit, :update, :xlsx, :search]
    else
      before_filter :find_table
    end

    def index
      @tables = RailsDb::Database.accessible_tables
    end

    def show
    end

    def data
      session[:per_page] = per_page
      @model   = @table.as_model
      @q       = @model.ransack(params[:q])
      @sql     = @q.result.page(params[:page]).per(per_page).to_sql
      @records = @q.result.page(params[:page]).per(per_page)
      @q.build_condition if @q.conditions.empty?
      @q.build_sort      if @q.sorts.empty?
      respond_to do |page|
        page.html {}
        page.js {}
      end
    end

    def csv
      send_data(@table.to_csv, type: 'text/csv; charset=utf-8; header=present', filename: "#{@table.name}.csv")
    end

    def xlsx
      render xlsx: 'table', filename: "#{@table.name}.xlsx"
    end

    def truncate
      @table.truncate
      render :data
    end

    def destroy
      @model   = @table.as_model
      @q       = @model.ransack(params[:q])
      @sql     = @q.result.page(params[:page]).per(per_page).to_sql
      @records = @q.result.page(params[:page]).per(per_page)
      @q.build_condition if @q.conditions.empty?
      @q.build_sort      if @q.sorts.empty?
      @table.delete(params[:pk_id])
      respond_to do |page|
        page.html { redirect_to action: :data, table_id: params[:table_id] }
        page.js {}
      end
    end

    def edit
      @record = @table.as_model.find(params[:pk_id])
      respond_to do |page|
        page.html { redirect_to action: :data, table_id: params[:table_id] }
        page.js {}
      end
    end

    def update
      @record = @table.as_model.find(params[:pk_id])
      @record.update_attributes(record_attributes)
      respond_to do |page|
        page.html { redirect_to action: :data, table_id: params[:table_id] }
        page.js {}
      end
    end

    private

    def record_attributes
      if Rails::VERSION::MAJOR >= 4
        params[:record].permit!
      else
        params[:record]
      end
    end

    def find_table
      @table ||= RailsDb::Table.new(params[:id] || params[:table_id])
    end

  end
end