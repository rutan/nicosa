require 'faraday'
require 'nicosa/errors'
require 'nicosa/response'

module Nicosa
  class Client
    DEFAULT_ENDPOINT = 'http://api.search.nicovideo.jp'.freeze

    def initialize(service: :video, user_agent: nil, endpoint: nil)
      @service = service
      @user_agent = user_agent
      @endpoint = endpoint || DEFAULT_ENDPOINT
      raise ArgumentError, 'undefined user_agent' unless @user_agent
    end

    def search(keyword, params = {})
      params = default_params.merge(params)
      params[:q] = keyword
      params[:_context] = @user_agent

      raw = client.get do |req|
        req.url "/api/v2/#{@service}/contents/search", params
      end
      response = Nicosa::Response.new(raw)

      case response.status
      when 200
        response
      when 400
        Nicosa::Errors::Invalid.new(response)
      else
        Nicosa::Errors::Exception.new(response)
      end
    end

    def client
      @client ||= Faraday.new(url: @endpoint) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
        faraday.headers[:user_agent] = @user_agent
      end
    end

    private

    def default_params
      {
        targets: 'title',
        fields: 'contentId',
        _sort: '-startTime',
      }
    end
  end
end
