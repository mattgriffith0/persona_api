module PersonaApi
  class InquiriesResource < Resource
    def add_tag(inq_id:, **attributes)
      post_request("inquiries/#{inq_id}/add-tag", body: attributes)
      true
    end

    def approve(inq_id:, **attributes)
      post_request("inquiries/#{inq_id}/approve", body: attributes)
    end

    def create(**attributes)
      # inquiry attributes must include one of 'template-id' or 'inquiry-template-id'
      Inquiry.new post_request("inquiries", body: attributes).body.dig("data")
    end

    def decline(inq_id:, **attributes)
      post_request("inquiries/#{inq_id}/decline", body: attributes)
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

    def remove_tag(inq_id:, **attributes)
      post_request("inquiries/#{inq_id}/remove-tag", body: attributes)
      true
    end

    def resume(inq_id:, **attributes)
      # this request will return only the session_token
      post_request("inquiries/#{inq_id}/resume", body: attributes).body.dig("meta", "session_token")
    end

    def set_all_tags(inq_id:, **attributes)
      post_request("inquiries/#{inq_id}/set-tags", body: attributes)
      true
    end

    def update(inq_id:, **attributes)
      Inquiry.new patch_request("inquiries/#{inq_id}", body: attributes).body.dig("data")
    end
  end
end