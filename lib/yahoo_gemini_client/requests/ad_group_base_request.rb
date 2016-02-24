module YahooGeminiClient
  class AdGroupBaseRequest < BaseRequest
    REQUEST_URI = "https://api.admanager.yahoo.com/v1/rest/adgroup"
    include Virtus.model

    def http_authorization_header
      { 'Authorization' => "Bearer #{access_token}" }
    end

    protected

    def post
      RestClient.post(
        REQUEST_URI,
        http_request_header.merge(http_authorization_header),
        request_body.to_json
      )
    end

    def get(opts)
      RestClient.get(
        opts[:request_uri],
        http_request_header.merge(http_authorization_header)
      )
    end
  end
end
