module PersonaApi
  class GovernmentIdVerificationsResource < Resource
    def create(**attributes)
      # Gov ID attributes must include a 'verification-template-id' as well as other fields as laid out
      # in the documentation https://docs.withpersona.com/reference/create-a-government-id-verification
      GovernmentIdVerification.new post_request("verification/government-ids", body: attributes).body.dig("data")
    end

    def retrieve(ver_id:)
      GovernmentIdVerification.new get_request("verification/government-ids/#{ver_id}").body.dig("data")
    end

    def submit(ver_id:, **attributes)
      GovernmentIdVerification.new post_request("verification/government-ids/#{ver_id}/submit", body: attributes).body.dig("data")
    end
  end
end