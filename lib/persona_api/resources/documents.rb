module PersonaApi
  class DocumentsResource < Resource
    def retrieve(doc_id:)
      Document.new get_request("documents/#{doc_id}").body.dig("data")
    end
  end
end