module PersonaApi
  class ReportsResource < Resource
    def add_tag(rep_id:, **attributes)
      post_request("reports/#{rep_id}/add-tag", body: attributes)
      true
    end

    def create(**attributes)
      # report attributes must include a 'report-template-id' as well as other fields as laid out
      # in the documentation https://docs.withpersona.com/reference/supported-report-types-and-examples

      Report.new post_request("reports", body: attributes).body.dig("data")
    end

    def list(**params)
      Collection.from_response get_request("reports", params: params), key: "data", type: Report
    end

    def retrieve(rep_id:)
      Report.new get_request("reports/#{rep_id}").body.dig("data")
    end

    def redact(rep_id:)
      delete_request("reports/#{rep_id}")
    end

    def remove_tag(rep_id:, **attributes)
      post_request("reports/#{rep_id}/remove-tag", body: attributes)
      true
    end

    def set_all_tags(rep_id:, **attributes)
      post_request("reports/#{rep_id}/set-tags", body: attributes)
      true
    end
  end
end