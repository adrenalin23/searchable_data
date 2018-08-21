require 'logger'

module Search
  class SearchByQuery
    def initialize(query:, searchable_languages:)
      @query = query
      @searchable_languages = searchable_languages
    end

    def search
      logger.debug("[Search::SearchByQuery] Search Regexp: #{search_regexp}")
      perform_search!
      logger.debug("[Search:SearchByQuery] Max search points: #{max_search_points}")
      return [] if max_search_points == 0
      search_results
    end

    private

    attr_reader :query, :searchable_languages

    def perform_search!
      searchable_languages.each(&method(:set_search_points!))
    end

    def max_search_points
      @max_search_points ||= searchable_languages.map { |el| el.search_points.to_i }.max
    end

    def search_results
      searchable_languages.map { |el| el.name if el.search_points == max_search_points }.compact
    end

    def set_search_points!(searchable_language)
      matches = searchable_language.searchable_data.scan(search_regexp)
      searchable_language.search_points = matches.count
    end

    def search_regexp
      @search_regexp ||= begin
        elements = query.search_statements.map { |el| "#{el}(?!\\w)" }

        /(?:#{elements.join('|')})/i
      end
    end

    def logger
      Logger.new(STDOUT)
    end
  end
end
