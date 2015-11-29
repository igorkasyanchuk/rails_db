module RailsDb
  module ApplicationHelper
    include ::FontAwesome::Rails::IconHelper

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
      cookies['sidebar_visible'] == 'true'
    end

    def title(str)
      content_for :title do
        raw("#{str}"[0].upcase + "#{str}"[1..-1])
      end
    end

    def paginate_table_entries(entries)
      params.delete(:id)
      return if entries.total_pages == 1
      prev_page_text = "#{fa_icon('arrow-left')} Previous".html_safe
      next_page_text = "Next #{fa_icon('arrow-right')}".html_safe

      html = '<div class="pagination">'
      if entries.previous_page
        html << link_to(prev_page_text, params.merge({ action: :data, page: entries.previous_page }), { remote: true, class: 'page' })
      end
      html << "#{page_links_for_pagination(entries)}"
      if entries.next_page
        html << link_to(next_page_text, params.merge({ action: :data, page: entries.next_page }), { remote: true, class: 'page' })
      end
      html << '</div>'

      sanitize(html)
    end

    private

    def page_links_for_pagination(entries)
      pages = pages_for_pagination(entries)
      links = []

      pages.each_with_index do |page,index|
        if page == entries.current_page
          links << content_tag(:b, page, { class: 'page current' })
        else
          links << link_to(page, params.merge({ action: :data, page: page}), { remote: true, class: 'page' })
        end
        links << ' ... ' if page != pages.last && (page + 1) != pages[index+1]
      end

      links.join(' ')
    end

    def pages_for_pagination(entries)
      last_page    = entries.total_pages
      current_page = entries.current_page

      pages = if last_page > 10
        [1, 2, 3] +
        (current_page-2..current_page+2).to_a +
        (last_page-2..last_page).to_a
      else
        (1..last_page).to_a
      end

      pages.uniq.select { |p| p > 0 && p <= last_page }
    end

    def db_hint_options
      result = {}
      RailsDb::Database.accessible_tables.each do |table_name|
        result[table_name] = RailsDb::Table.new(table_name).columns.inject({}) {|res, e| res[e.name] = nil; res }
      end
      result
    end

  end
end
