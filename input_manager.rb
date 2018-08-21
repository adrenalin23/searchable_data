class InputManager
  # pass two used strategies manage input
  def initialize(reader:, parser:)
    @reader = reader
    @parser = parser
  end

  def data
    @data ||= begin
      input = reader.call
      parser.call(input)
    end
  end

  private

  attr_reader :reader, :parser
end
