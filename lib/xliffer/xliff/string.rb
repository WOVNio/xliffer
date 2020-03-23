module XLIFFer
  class XLIFF
    class String
      attr_reader :id, :source, :target, :state, :note
      def initialize(trans_unit_xml)
        unless XLIFF.xml_element?(trans_unit_xml) && trans_unit?(trans_unit_xml)
          error_message = "can't create a String without a trans-unit subtree"
          raise ArgumentError, error_message
        end

        @xml = trans_unit_xml
        @id = @xml.attr('id')
        @source = find_source
        @note   = find_note

        target = find_target
        @target = target.text
        @state = target.attr('state')
      end

      def target=(val)
        target = @xml.xpath('./target')
        target.first.content = val
        @target = val
      end

      def source=(val)
        source = @xml.xpath('./source')
        source.first.content = val
        @source = val
      end

      private

      def trans_unit?(xml)
        xml.name.downcase == 'trans-unit'
      end

      def find_source
        sources = @xml.xpath('./source')
        error_message = 'Should have only one source tag'
        raise MultipleElement, error_message if sources.size > 1

        error_message = 'Should have one source tag'
        raise NoElement, error_message unless sources.size == 1

        sources.first.text
      end

      def find_target
        targets = @xml.xpath('./target')

        error_message = 'Should have only one target tag'
        raise MultipleElement, error_message if targets.size > 1

        if targets.empty?
          targets << Nokogiri::XML::Node.new('target', @xml)
          @xml.add_child(targets.first)
        end
        targets.first
      end

      def find_note
        notes = @xml.xpath('./note')
        error_message = 'Should have only one target tag'
        raise MultipleElement, error_message if notes.size > 1

        notes.first ? notes.first.text : ''
      end
    end
  end
end
