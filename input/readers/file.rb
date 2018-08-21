module Input
  module Readers
    class File
      def initialize(file_name)
        @file_name = file_name
      end

      def call
        ::File.read(file_name)
      end

      private

      attr_reader :file_name
    end
  end
end
