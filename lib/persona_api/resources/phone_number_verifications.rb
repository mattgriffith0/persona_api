module PersonaApi
  class PhoneNumberVerificationsResource < Resource
    def confirm(ver_id:, **attributes)
      PhoneNumberVerification.new post_request("verification/phone-numbers/#{ver_id}/confirm", body: attributes).body.dig("data")
    end

    def create(**attributes)
      # Phone number attributes must include a 'verification-template-id', 'phone-number' and 'country-code' as well
      # as other fields as laid out in the documentation https://docs.withpersona.com/reference/create-a-phone-number-verification
      PhoneNumberVerification.new post_request("verification/phone-numbers", body: attributes).body.dig("data")
    end

    def retrieve(ver_id:)
      PhoneNumberVerification.new get_request("verification/phone-numbers/#{ver_id}").body.dig("data")
    end

    def send_sms(ver_id:, **attributes)
      PhoneNumberVerification.new post_request("verification/phone-numbers/#{ver_id}/send-confirmation-code", body: attributes).body.dig("data")
    end
  end
end