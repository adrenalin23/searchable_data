require_relative 'query'

module Models
  # use in case if string is used as input query
  class StringQuery < Query
    def initialize(string_input)
      @input_statements = transform_input_for(string_input)
    end

    private

    def transform_input_for(string_input)
      string_input.scan(/(?:(?<=").+?(?="))|\w+/)
    end
  end
end

