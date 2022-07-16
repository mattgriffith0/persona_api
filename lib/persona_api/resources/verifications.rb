module PersonaApi
  class VerificationsResource < Resource
    def print(ver_id:)
      get_request("verifications/#{ver_id}/print")
    end

    def retrieve(ver_id:)
      Verification.new get_request("verifications/#{ver_id}").body.dig("data")
    end
  end
end