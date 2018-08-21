require_relative '../models/searchable_language'

module Search
  module DataGenerator
    class << self
      def call(languages)
        languages.map(&method(:generate_data_item))
      end

      private

      def generate_data_item(language)
        Models::SearchableLanguage.new(
          name: language.name,
          searchable_data: searchable_data_for(language)
        )
      end

      def searchable_data_for(language)
        [language.name, language.type, language.designed_by].join(';')
      end
    end
  end
end
