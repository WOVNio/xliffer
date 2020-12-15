require 'nokogiri'

module XLIFFer
  class XLIFF
    class File
      attr_reader :source_language, :target_language, :original, :strings
      alias file_name original

      def initialize(xml)
        raise ArgumentError, "can't create a File without a file subtree" unless XLIFF.xml_element?(xml) && file?(xml)

        @xml = xml

        @original = @xml.attr('original')
        @source_language = @xml.attr('source-language')
        @target_language = @xml.attr('target-language')
        @strings = @xml.xpath('.//trans-unit').map { |tu| String.new(tu) }
      end

      def [](id)
        @strings.find { |s| s.id == id }
      end

      def []=(id, target)
        self[id].target = target
      end

      def source_language=(val)
        @source_language = val
        @xml['source-language'] = val
      end

      def target_language=(val)
        @target_language = val
        @xml['target-language'] = val
      end

      def get_attribute(attr_name)
        @xml[attr_name]
      end

      private

      def file?(xml)
        xml.name.downcase == 'file'
      end
    end
  end
end
