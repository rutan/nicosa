module Nicosa
  module Services
    class Channel < Nicosa::Client
      def initialize(user_agent: nil)
        super(service: :channel, user_agent: user_agent)
      end

      private

      def default_params
        {
          targets: 'title,description,tags',
          fields: 'contentId,title,description,tags,startTime,thumbnailUrl',
          _sort: '-startTime',
        }
      end
    end
  end
end
