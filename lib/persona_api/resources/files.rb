module PersonaApi
  class FilesResource < Resource
    def download(file_id:, file_name:)
      get_request("files/#{file_id}/#{file_name}").body.dig("data")
      true
    end
  end
end