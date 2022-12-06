module PersonaApi
  class DatabaseVerificationsResource < Resource
    def create(**attributes)
      # Database attributes must include a 'verification-template-id' and 'country-code' as well as other fields as laid out
      # in the documentation https://docs.withpersona.com/reference/create-a-database-verification
      DatabaseVerification.new post_request("verification/databases", body: attributes).body.dig("data")
    end

    def retrieve(ver_id:)
      DatabaseVerification.new get_request("verification/databases/#{ver_id}").body.dig("data")
    end

    def submit(ver_id:, **attributes)
      DatabaseVerification.new post_request("verification/databases/#{ver_id}/submit", body: attributes).body.dig("data")
    end
  end
end