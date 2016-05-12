require 'json'
require 'hashie'
require 'faraday'

module Nicosa
  class Response
    include Enumerable

    def initialize(response)
      @original = response
    end

    def status
      @original.status
    end

    def response
      @response ||=
        begin
          resp = Hashie::Mash.new(JSON.parse(@original.body))
          (resp.data || []).each do |n|
            n.url = guess_url(n['contentId'])
          end
          resp
        end
    end

    def meta
      response.meta || {}
    end

    def error_message
      meta['errorMessage']
    end

    def data
      response.data || []
    end

    def each
      data.each { |n| yield n }
    end

    private

    def guess_url(content_id)
      case content_id.sub(/\d+\z/, '')
      when '_comic'
        "http://seiga.nicovideo.jp/comic/#{content_id.sub('_comic', '')}"
      else
        "http://nico.ms/#{content_id}"
      end
    end
  end
end
