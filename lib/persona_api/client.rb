require "faraday"
require "faraday_middleware"

module PersonaApi
  class Client
    BASE_URL = 'https://withpersona.com/api/v1/'

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def accounts
      AccountsResource.new(self)
    end

    def inquiries
      InquiriesResource.new(self)
    end

    def verifications
      VerificationsResource.new(self)
    end

    def connection
      @connection ||= Faraday.new do |connection|
        connection.url_prefix = BASE_URL
        connection.request :authorization, :Bearer, api_key
        connection.headers['Key-Inflection'] = "snake"
        connection.request :json
        connection.response :json, content_type: "application/json"
        connection.adapter adapter
      end
    end
  end
end