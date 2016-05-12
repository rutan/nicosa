module Nicosa
  module Services
    class ChannelArticle < Nicosa::Client
      def initialize(user_agent: nil)
        super(service: :channelarticle, user_agent: user_agent)
      end

      private

      def default_params
        {
          targets: 'title,description,tags',
          fields: 'contentId,title,description,tags,mylistCounter,commentCounter,startTime,thumbnailUrl',
          _sort: '-startTime',
        }
      end
    end

    class Blomaga < ChannelArticle; end
  end
end
