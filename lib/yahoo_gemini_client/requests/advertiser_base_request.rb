module YahooGeminiClient
  class AdvertiserBaseRequest < BaseRequest
    REQUEST_URI = 'https://api.admanager.yahoo.com/v1/rest/advertiser'
    include Virtus.model

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
