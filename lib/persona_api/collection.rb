module PersonaApi
  class Collection
    attr_reader :data, :next_page, :prev_page

    def self.from_response(response, key:, type:)
      body = response.body
      new(
        data: body[key].map{ |attrs| type.new(attrs) },
        next_page: body.dig("links", "next"),
        prev_page: body.dig("links", "prev")
      )
    end

    def initialize(data:, next_page:, prev_page:)
      @data = data
      @next_page = next_page.nil? ? nil : data.last.id
      @prev_page = prev_page.nil? ? nil : data.first.id
    end
  end
end