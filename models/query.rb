module Models
  # use in case if input query is already splitted by statements
  class Query
    def initialize(input_statements)
      @input_statements = input_statements
    end

    def search_statements
      input_statements.flat_map { |statement| words_permutation_for(statement) }
    end

    private

    attr_reader :input_statements

    def words_permutation_for(statement, separator = ' ')
      words = statement.split(separator)
      return words if words.count == 1
      words.permutation.map { |el| el.join(separator) }
    end
  end
end

