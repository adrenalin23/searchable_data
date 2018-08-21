require_relative 'input_manager'
require_relative 'search'
require_relative 'input/parsers/json'
require_relative 'input/readers/file'
require_relative 'models/query'
# require_relative 'models/string_query'

# ARGV query example. 1: Lisp Common
# ARGV query example. 2: Interpreted "Thomas Eugene"
# ARGV query example. 3: Scripting Microsoft
# ARGV query example. 4: Interpreted "Eugene Thomas"
query = Models::Query.new(ARGV)

# in order to use string as query instead of ARGV use
# query = Models::StringQuery.new('Interpreted "Thomas Eugene"')
# and uncomment line `require_relative 'models/string_query'`

input_manager = InputManager.new(
  reader: Input::Readers::File.new('data.json'),
  parser: Input::Parsers::Json
)
languages = input_manager.data

results = Search.call(query: query, languages: languages)

puts results
