module Models
  class SearchableLanguage
    attr_reader :name, :searchable_data
    attr_accessor :search_points

    def initialize(name:, searchable_data:)
      @name = name
      @searchable_data = searchable_data
    end

    def to_s
      "<#{super} (name: #{name}; searchable_data: #{searchable_data}; search_points: #{search_points})>"
    end
  end
end

