module YahooGeminiClient
  class CustomReportBaseRequest < BaseRequest
    GET_REQUEST_URI = 'https://api.admanager.yahoo.com/v1/rest/reports/custom'
    POST_REQUEST_URI = GET_REQUEST_URI + '?reportFormat=json'
    include Virtus.model

    protected

    def post(opts)
      RestClient.post(
        opts[:request_uri],
        request_body.to_json,
        http_request_header.merge(http_authorization_header)
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
