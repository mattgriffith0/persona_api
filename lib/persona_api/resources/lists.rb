module PersonaApi
  class ListsResource < Resource
    def list(**params)
      Collection.from_response get_request("lists", params: params), key: "data", type: List
    end

    def retrieve(lst_id:)
      List.new get_request("lists/#{lst_id}").body.dig("data")
    end

    def archive(lst_id:)
      delete_request("lists/#{lst_id}")
    end

    def create_browser_fingerprint_list(**attributes)
      List.new post_request("lists/browser-fingerprints", body: attributes).body.dig("data")
    end

    def create_country_list(**attributes)
      List.new post_request("lists/countries", body: attributes).body.dig("data")
    end

    def create_email_address_list(**attributes)
      List.new post_request("lists/email-addresses", body: attributes).body.dig("data")
    end

    def create_face_list(**attributes)
      List.new post_request("lists/faces", body: attributes).body.dig("data")
    end

    def create_geolocation_list(**attributes)
      List.new post_request("lists/geolocations", body: attributes).body.dig("data")
    end

    def create_government_id_number_list(**attributes)
      List.new post_request("lists/government-id-numbers", body: attributes).body.dig("data")
    end

    def create_ip_address_list(**attributes)
      List.new post_request("lists/ip-addresses", body: attributes).body.dig("data")
    end

    def create_name_list(**attributes)
      List.new post_request("lists/names", body: attributes).body.dig("data")
    end

    def create_phone_number_list(**attributes)
      List.new post_request("lists/phone-numbers", body: attributes).body.dig("data")
    end
  end
end