module PersonaApi
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    def post_request(url, body:, headers: {})
      handle_response client.connection.post(url, body, headers)
    end

    def patch_request(url, body:, headers: {})
      handle_response client.connection.patch(url, body, headers)
    end

    def put_request(url, body:, headers: {})
      handle_response client.connection.put(url, body, headers)
    end

    def delete_request(url, params: {}, headers: {})
      handle_response client.connection.delete(url, params, headers)
    end

    def handle_response(response)
      
      case response.status
      when 400
        raise Error, "The request was unacceptable, often due to invalid parameters."
      when 401
        raise Error, "Not authenticated - check your API key"
      when 403
        raise Error, "The given API key doesn't have permissions to perform the request or a quota has been exceeded."
      when 404
        raise Error, "The requested resource doesn't exist."
      when 429
        raise Error, "Your organization's rate limit has been exceeded. We recommend an exponential backoff on requests."
      when 500
        raise Error, "Something went wrong on Persona's end."
      end

      response
    end
  end
end