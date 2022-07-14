module PersonaApi
  class ListItemsResource < Resource
    # These archive requests will return the body of the response. This is slightly different
    # from other endpoints with redact/archive requests, as the List Items endpoint doesn't
    # contain a `retrieve` method.

    def archive_browser_fingerprint_list_item(libf_id:)
      delete_request("list-item/browser-fingerprints/#{libf_id}").body.dig("data")
    end

    def archive_country_list_item(libf_id:)
      delete_request("list-item/countries/#{libf_id}").body.dig("data")
    end

    def archive_email_address_list_item(libf_id:)
      delete_request("list-item/email-addresses/#{libf_id}").body.dig("data")
    end

    def archive_face_list_item(libf_id:)
      delete_request("list-item/faces/#{libf_id}").body.dig("data")
    end

    def archive_geolocation_list_item(libf_id:)
      delete_request("list-item/geolocations#{libf_id}").body.dig("data")
    end

    def archive_government_id_number_list_item(libf_id:)
      delete_request("list-item/government-id-numbers#{libf_id}").body.dig("data")
    end

    def archive_ip_address_list_item(libf_id:)
      delete_request("list-item/ip-addresses#{libf_id}").body.dig("data")
    end

    def archive_name_list_item(libf_id:)
      delete_request("list-item/names#{libf_id}").body.dig("data")
    end

    def archive_phone_number_list_item(libf_id:)
      delete_request("list-item/phone-numbers#{libf_id}").body.dig("data")
    end

    def create_browser_fingerprint_list_item(**attributes)
      ListItem.new post_request("list-item/browser-fingerprints", body: attributes).body.dig("data")
    end

    def create_country_list_item(**attributes)
      ListItem.new post_request("list-item/countries", body: attributes).body.dig("data")
    end

    def create_email_address_list_item(**attributes)
      ListItem.new post_request("list-item/email-addresses", body: attributes).body.dig("data")
    end

    def create_face_list_item(**attributes)
      ListItem.new post_request("list-item/faces", body: attributes).body.dig("data")
    end

    def create_geolocation_list_item(**attributes)
      ListItem.new post_request("list-item/geolocations", body: attributes).body.dig("data")
    end

    def create_government_id_number_list_item(**attributes)
      ListItem.new post_request("list-item/government-id-numbers", body: attributes).body.dig("data")
    end

    def create_ip_address_list_item(**attributes)
      ListItem.new post_request("list-item/ip-addresses", body: attributes).body.dig("data")
    end

    def create_name_list_item(**attributes)
      ListItem.new post_request("list-item/names", body: attributes).body.dig("data")
    end

    def create_phone_number_list_item(**attributes)
      ListItem.new post_request("list-item/phone-numbers", body: attributes).body.dig("data")
    end
  end
end