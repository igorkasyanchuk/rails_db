module RailsDb
  class History

    class << self

      def instance
        $history ||= []
      end

      def add(sql)
        instance.push(sql) unless last == sql
      end

      def last
        history[0]
      end

      def remove(sql)
        instance.delete(sql)
      end

      def history
        instance.reverse
      end

    end

  end
end