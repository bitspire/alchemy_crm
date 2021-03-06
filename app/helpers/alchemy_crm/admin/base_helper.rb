module AlchemyCrm
  module Admin
    module BaseHelper

      # Renders a <small> html tag with the contact count for current tag in it.
      def contact_count_from_tag(tag)
        content_tag('small', "(#{Contact.tagged_with(tag).count})")
      end

    end
  end
end