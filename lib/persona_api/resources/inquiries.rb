module PersonaApi
  class InquiriesResource < Resource
    def create(**attributes)
      # inquiry attributes must include one of 'template-id' or 'inquiry-template-id'
      Inquiry.new post_request("inquiries", body: attributes).body.dig("data")
    end

    def list(**params)
      Collection.from_response get_request("inquiries", params: params), key: "data", type: Inquiry
    end

    def retrieve(inq_id:)
      Inquiry.new get_request("inquiries/#{inq_id}").body.dig("data")
    end

    def redact(inq_id:)
      delete_request("inquiries/#{inq_id}")
    end

    def remove_tag(act_id:, **attributes)
      post_request("inquiries/#{inq_id}/remove-tag", body: attributes)
      true
    end

    def set_all_tags(inq_id:, **attributes)
      post_request("inquiries/#{inq_id}/set-tags", body: attributes)
      true
    end

    def update(inq_id:, **attributes)
      patch_request("inquiries/#{inq_id}", body: attributes).body.dig("data")
    end
  end
end