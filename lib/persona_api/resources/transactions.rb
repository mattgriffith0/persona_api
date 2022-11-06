module PersonaApi
  class TransactionsResource < Resource
    def create(**attributes)
      Transaction.new post_request("transactions", body: attributes).body.dig("data")
    end

    def list(**params)
      Collection.from_response get_request("transactions", params: params), key: "data", type: Transaction
    end

    def retrieve(txn_id:)
      Transaction.new get_request("transactions/#{txn_id}").body.dig("data")
    end
  end
end