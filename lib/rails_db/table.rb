require 'active_model'

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
      self
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

    def create_model(table_name, &block)
      begin
        klass = Class.new(RailsDb.abstract_model_class) do
          def self.model_name
            ActiveModel::Name.new(self, nil, table_name)
          end
          self.table_name = table_name
          self.inheritance_column = nil
        end
        klass.count # verify that it works, if not load other, hack
      rescue
        klass = RailsDb.abstract_model_class.descendants.detect { |c| c.table_name == table_name }
      end

      add_ransack_methods(klass) if ransack_version >= Gem::Version.new('4.0.0')
      klass.class_eval(&block) if block_given?

      klass
    end

    def as_model
      @model ||= create_model(name)
    end

    def add_ransack_methods(klass)
      klass.define_singleton_method(:ransackable_attributes) do |auth_object = nil|
        column_names.map(&:to_sym) + column_names
      end

      klass.define_singleton_method(:ransortable_attributes) do |auth_object = nil|
        column_names.map(&:to_sym) + column_names
      end

      klass.define_singleton_method(:ransackable_associations) do |auth_object = nil|
        []
      end
    end

    def ransack_version
      Gem.loaded_specs['ransack'].version
    end
  end # module

end
