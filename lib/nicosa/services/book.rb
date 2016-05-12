module Nicosa
  module Services
    class Book < Nicosa::Client
      def initialize(user_agent: nil)
        super(service: :book, user_agent: user_agent)
      end

      private

      def default_params
        {
          targets: 'title,description,tags',
          fields: 'contentId,title,description,tags,viewCounter,mylistCounter,commentCounter,startTime,thumbnailUrl',
          _sort: '-startTime',
        }
      end
    end
  end
end
