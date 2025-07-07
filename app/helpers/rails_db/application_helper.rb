module RailsDb
  module ApplicationHelper

    def rails_db
      super
    rescue NameError
      guess_name(request.path.split('/').reject(&:blank?))
    end

    # in case engine was added in namespace
    def guess_name(sections)
      if sections.size > 1
        sections[-1] = 'rails_db'
        variable     = sections.join("_")
        result       = eval(variable)
      end
    rescue NameError
      sections.delete_at(-2)
      guess_name(sections)
    end

    def rails_db_tables
      RailsDb::Database.accessible_tables
    end

    def link_to_add_fields(name, f, type)
      new_object = f.object.send "build_#{type}"
      id = "new_#{type}"
      fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
        render(type.to_s + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

    def sidebar_classes
      if show_sidebar?
        'large-3 large-pull-9 columns'
      else
        'large-3 large-pull-9 columns hide'
      end
    end

    def main_content_classes
      if show_sidebar?
        'large-9 push-3 columns collapsed'
      else
        'large-12 push-0 columns expanded'
      end
    end

    def show_sidebar?
      return true if controller_name == 'dashboard' && action_name == 'index'
      cookies['sidebar_hidden'] != 'true'
    end

    def title(str)
      content_for :title do
        raw("#{str}"[0].upcase + "#{str}"[1..-1])
      end
    end

    def fa_icon(icon_name)
      %{<i class="fa fa-#{icon_name}"></i>}.html_safe
    end

    def db_hint_options
      result = {}
      RailsDb::Database.accessible_tables.each do |table_name|
        result[table_name] = RailsDb::Table.new(table_name).columns.inject([]) {|res, e| res << e.name; res }
      end
      result
    end

    def params_to_hash(p)
      if p.respond_to?(:to_unsafe_h)
        p.to_unsafe_h
      else
        p
      end
    end

    def insert_css_file(file)
      if using_sprockets?
        # For Sprockets, use the asset pipeline
        # Remove .css extension and use the file path as-is for asset pipeline
        asset_name = file.gsub('.css', '')
        stylesheet_link_tag asset_name, media: "all"
      else
        # For Propshaft/Rails 8 compatibility - inline the CSS
        css_path = File.expand_path(File.dirname(__FILE__) + "/../../assets/stylesheets/#{file}")
        if File.exist?(css_path)
          raw "<style>#{File.read(css_path)}</style>"
        else
          ""
        end
      end
    end

    def insert_js_file(file)
      if using_sprockets?
        # For Sprockets, use the asset pipeline
        # Remove .js extension and use the file path as-is for asset pipeline
        asset_name = file.gsub('.js', '')
        javascript_include_tag asset_name
      else
        # For Propshaft/Rails 8 compatibility - inline the JavaScript
        js_path = File.expand_path(File.dirname(__FILE__) + "/../../assets/javascripts/#{file}")
        if File.exist?(js_path)
          raw "<script>#{File.read(js_path)}</script>"
        else
          ""
        end
      end
    end

    private

    def using_sprockets?
      # Check if sprockets-rails is available and being used
      return false unless defined?(Sprockets)
      
      # Check if Rails.application.assets is a Sprockets environment
      Rails.application.assets.is_a?(Sprockets::Environment) ||
      Rails.application.assets.is_a?(Sprockets::Index)
    rescue
      # If anything fails, assume we're not using Sprockets
      false
    end
  end
end
