module RailsDb
  module TablePagination

    def next_page
      current_page < total_pages ? (current_page + 1) : nil
    end

    def paginate(options = {})
      self.per_page     = (options[:per_page] || 10).to_i
      self.current_page = (options[:page] || 1).to_i
      self.offset       = current_page * per_page - per_page
      self.sort_column  = options[:sort_column]
      self.sort_order   = options[:sort_order]
      self
    end

    def previous_page
      current_page > 1 ? (current_page - 1) : nil
    end

    def total_entries
      @total_entries ||= count
    end

    def total_pages
      total_entries.zero? ? 1 : (total_entries / per_page.to_f).ceil
    end

  end
end