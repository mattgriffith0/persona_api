module PersonaApi
  class EventsResource < Resource
    def list(**params)
      Collection.from_response get_request("events", params: params), key: "data", type: Event
    end

    def retrieve(evt_id:)
      Event.new get_request("events/#{evt_id}").body.dig("data")
    end
  end
end