module PersonaApi
  class AccountsResource < Resource
    def add_tag(act_id:, **attributes)
      post_request("accounts/#{act_id}/add-tag", body: attributes)
      true
    end

    def consolidate_accounts(act_id:, **attributes)
      post_request("accounts/#{act_id}/consolidate", body: attributes).body.dig("data")
    end

    def create(**attributes)
      Account.new post_request("accounts", body: attributes).body.dig("data")
    end

    def list(**params)
      Collection.from_response get_request("accounts", params: params), key: "data", type: Account
    end

    def retrieve(act_id:)
      Account.new get_request("accounts/#{act_id}").body.dig("data")
    end

    def redact(act_id:)
      delete_request("accounts/#{act_id}")
    end

    def remove_tag(act_id:, **attributes)
      post_request("accounts/#{act_id}/remove-tag", body: attributes)
      true
    end

    def set_all_tags(act_id:, **attributes)
      post_request("accounts/#{act_id}/set-tags", body: attributes)
      true
    end

    def update(act_id:, **attributes)
      patch_request("accounts/#{act_id}", body: attributes).body.dig("data")
    end
  end
end