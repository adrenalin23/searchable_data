module Models
  class Language
    attr_reader :name, :type, :designed_by

    def initialize(name:, type:, designed_by:)
      @name = name
      @type = type
      @designed_by = designed_by
    end

    def to_s
      "<#{super} (name: #{name}; type: #{type}; designed_by: #{designed_by})>"
    end
  end
end

