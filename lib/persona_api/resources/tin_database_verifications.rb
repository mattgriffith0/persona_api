module PersonaApi
  class TinDatabaseVerificationsResource < Resource
    def create(**attributes)
      # TIN Database attributes must include a 'verification-template-id', a 'tin' as well as other fields as laid out
      # in the documentation https://docs.withpersona.com/reference/create-a-tin-database-verification
      TinDatabaseVerification.new post_request("verification/database-tins", body: attributes).body.dig("data")
    end

    def retrieve(ver_id:)
      TinDatabaseVerification.new get_request("verification/database-tins/#{ver_id}").body.dig("data")
    end

    def submit(ver_id:, **attributes)
      TinDatabaseVerification.new post_request("verification/database-tins/#{ver_id}/submit", body: attributes).body.dig("data")
    end
  end
end