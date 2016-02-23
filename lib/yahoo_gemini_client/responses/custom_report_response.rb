module YahooGeminiClient
  class CustomReportResponse < BaseResponse
    attr_accessor :errors, :timestamp, :job_id, :status, :url

    def initialize(json_response)
      @errors = json_response[:errors]
      @timestamp = json_response[:timestamp]
      if json_response[:response]
        @job_id = json_response[:response][:jobId]
        @status = json_response[:response][:status]
        @url = json_response[:response][:jobResponse]
      end
    end

    def completed?
      @status == 'completed'
    end
  end
end
