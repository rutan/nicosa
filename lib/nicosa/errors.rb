module Nicosa
  module Errors
    class Exception < StandardError
      def initialize(response)
        @response = response
        super(@response.error_message.to_s)
      end
      attr_reader :response
    end
    class Invalid < Exception; end
  end
end
