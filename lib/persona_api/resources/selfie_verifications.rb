module PersonaApi
  class SelfieVerificationsResource < Resource
    def create(**attributes)
      # Selfie attributes must include a 'verification-template-id' as well as other fields as laid out
      # in the documentation https://docs.withpersona.com/reference/create-a-selfie-verification
      SelfieVerification.new post_request("verification/selfies", body: attributes).body.dig("data")
    end

    def retrieve(ver_id:)
      SelfieVerification.new get_request("verification/selfies/#{ver_id}").body.dig("data")
    end

    def submit(ver_id:, **attributes)
      SelfieVerification.new post_request("verification/selfies/#{ver_id}/submit", body: attributes).body.dig("data")
    end
  end
end