module RailsDb

  class Table
    include Connection

    attr_reader :name, :data

    delegate :count,     to: :data
    delegate :paginate,  to: :data
    delegate :limit,     to: :data
    delegate :order,     to: :data
    delegate :asc,       to: :data
    delegate :desc,      to: :data

    def initialize(table_name)
      throw 'Access Denied' unless RailsDb::Database.accessible_tables.include?(table_name)
      @name = table_name
      @data = RailsDb::TableData.new(self)
    end

    def to_csv
      CSV.generate do |csv|
        csv << column_names
        data.data.rows.each do |row|
          csv << row
        end
      end
    end

    def indexes
      RailsDb::Database.indexes(name)
    end

    def truncate
      RailsDb::Database.truncate(name)
    end

    def primary_key
      RailsDb::Database.primary_key(name)
    end

    def delete(id)
      RailsDb::Database.delete(name, primary_key, id)
    end

    def update(column_name, value, id)
      RailsDb::Database.execute("update #{@name} set #{column_name} = '#{value}' where id == #{id}")
    end

  end # module

end