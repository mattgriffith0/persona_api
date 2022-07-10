module PersonaApi
  class CasesResource < Resource
    def add_persona_objects(case_id:, **attributes)
      Case.new post_request("cases/#{case_id}/add-objects", body: attributes).body.dig("data")
    end

    def assign(case_id:, **attributes)
      Case.new post_request("cases/#{case_id}/assign", body: attributes).body.dig("data")
    end

    def create(**attributes)
      # cases attributes must include the 'case-template-id'
      Case.new post_request("cases", body: attributes).body
    end

    def list(**params)
      Collection.from_response get_request("cases", params: params), key: "data", type: Case
    end

    def retrieve(case_id:)
      Case.new get_request("cases/#{case_id}").body
    end

    def set_status(case_id:, **attributes)
      Case.new post_request("cases/#{case_id}/set-status", body: attributes).body.dig("data")
    end
  end
end