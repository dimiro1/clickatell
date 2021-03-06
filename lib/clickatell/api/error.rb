module Clickatell
  class API
  
    # Clickatell API Error exception.
    class Error < StandardError
      attr_reader :code, :message
      
      def initialize(code, message)
        @code, @message = code, message
      end
      
      # Creates a new Error from a Clickatell HTTP response string
      # e.g.:
      #
      #  Error.parse("ERR: 001, Authentication error")
      #  # =>  #<Clickatell::API::Error code='001' message='Authentication error'>
      def self.parse(error_string)
        error_details = error_string.split(':').last.strip

        if error_details.split(',').length < 2
          code = "Unknown"
          message = error_details.split(',')[0]
        else
          code, message = error_details.split(',').map { |s| s.strip }
        end

        self.new(code, message)
      end
    end
  
  end
end
