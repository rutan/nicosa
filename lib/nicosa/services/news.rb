module Nicosa
  module Services
    class News < Nicosa::Client
      def initialize(user_agent: nil)
        super(service: :news, user_agent: user_agent)
      end

      private

      def default_params
        {
          targets: 'title,tags',
          fields: 'contentId,title,description,tags,commentCounter,startTime',
          _sort: '-startTime',
        }
      end
    end
  end
end
