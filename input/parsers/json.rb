require_relative '../../models/language'
require 'json'

module Input
  module Parsers
    class Json
      class << self
        def call(data)
          wrap(
            JSON.parse(data)
          )
        end

        private

        def wrap(parsed_data)
          parsed_data.map(&method(:wrap_object))
        end

        def wrap_object(data_element)
          Models::Language.new(
            name: data_element["Name"],
            type: data_element["Type"],
            designed_by: data_element["Designed by"]
          )
        end
      end
    end
  end
end
