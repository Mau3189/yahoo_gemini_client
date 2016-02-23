module YahooGeminiClient
  class CustomReportBaseRequest < BaseRequest
    GET_REQUEST_URI = 'https://api.admanager.yahoo.com/v1/rest/reports/custom'
    POST_REQUEST_URI = GET_REQUEST_URI + '?reportFormat=json'
    include Virtus.model

    def http_authorization_header
      { 'Authorization' => "Bearer #{access_token}" }
    end

    protected

    def post(opts)
      HTTParty.post(opts[:request_uri],
        headers: http_request_header.merge(http_authorization_header),
        body: request_body.to_json,
      )
    end

    def get(opts)
      HTTParty.get(opts[:request_uri],
        headers: http_request_header.merge(http_authorization_header),
      )
    end
  end
end
