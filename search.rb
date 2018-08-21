require_relative 'search/data_generator'
require_relative 'search/search_by_query'

module Search
  class << self
    def call(query:, languages:)
      searchable_languages = Search::DataGenerator.call(languages)
      Search::SearchByQuery.new(query: query, searchable_languages: searchable_languages).search
    end
  end
end
