module RailsDb
  class SqlExplain < SqlQueryData

    def sql
      "EXPLAIN #{super}"
    end

  end
end