module PersonaApi
  class UserAuditLogsResource < Resource
    def list(**params)
      Collection.from_response get_request("user-audit-logs", params: params), key: "data", type: UserAuditLog
    end

    def retrieve(ual_id:)
      ApiLog.new get_request("user-audit-logs/#{ual_id}").body.dig("data")
    end
  end
end