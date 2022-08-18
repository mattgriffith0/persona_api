module PersonaApi
  class PhoneCarrierVerificationsResource < Resource
    def create(**attributes)
      # Database attributes must include a 'verification-template-id' as well as other fields as laid out
      # in the documentation https://docs.withpersona.com/reference/create-a-phone-carrier-database-verification
      PhoneCarrierVerification.new post_request("verification/database-phone-carriers", body: attributes).body.dig("data")
    end

    def retrieve(ver_id:)
      PhoneCarrierVerification.new get_request("verification/database-phone-carriers/#{ver_id}").body.dig("data")
    end

    def submit(ver_id:, **attributes)
      PhoneCarrierVerification.new post_request("verification/database-phone-carriers/#{ver_id}/submit", body: attributes).body.dig("data")
    end
  end
end