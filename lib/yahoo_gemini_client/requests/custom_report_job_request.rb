module YahooGeminiClient
  class CustomReportJobRequest < CustomReportBaseRequest
    attribute :request_body

    def execute
      response = post(
        request_uri: POST_REQUEST_URI,
        request_body: request_body.to_json
      )
      CustomReportResponse.new(
        JSON.parse(response.body).with_indifferent_access
      )
    end
  end
end
