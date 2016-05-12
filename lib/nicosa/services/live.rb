module Nicosa
  module Services
    class Live < Nicosa::Client
      def initialize(user_agent: nil)
        super(service: :live, user_agent: user_agent)
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
            commentCounter
            startTime
            thumbnailUrl
            communityIcon
            scoreTimeshiftReserved
            liveStatus
          ).join(','),
          _sort: '-startTime',
        }
      end
    end
  end
end
