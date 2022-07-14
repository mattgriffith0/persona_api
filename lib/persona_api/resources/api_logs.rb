module PersonaApi
  class ApiLogsResource < Resource
    def list(**params)
      Collection.from_response get_request("api-logs", params: params), key: "data", type: ApiLog
    end

    def retrieve(req_id:)
      ApiLog.new get_request("api-logs/#{req_id}").body.dig("data")
    end
  end
end