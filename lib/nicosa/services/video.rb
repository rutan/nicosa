module Nicosa
  module Services
    class Video < Nicosa::Client
      def initialize(user_agent: nil)
        super(service: :video, user_agent: user_agent)
      end

      private

      def default_params
        {
          targets: 'title,description,tags',
          fields: %w(
            contentId
            title
            description
            tags
            categoryTags
            viewCounter
            mylistCounter
            commentCounter
            startTime
            thumbnailUrl
          ).join(','),
          _sort: '-startTime',
        }
      end
    end
  end
end
