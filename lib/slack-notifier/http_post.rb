module Slack
  class Notifier

    class HTTPPost

      class << self
        def to uri, params
          HTTPPost.new( uri, params ).call
        end
      end

      attr_reader :uri, :params

      def initialize uri, params
        @uri    = uri
        @params = params
      end

      def call
        http_obj.request request_obj
      end

      private

        def request_obj
          req = Net::HTTP::Post.new uri.request_uri
          req.set_form_data params

          return req
        end

        def http_obj
          http = Net::HTTP.new uri.host, uri.port
          http.use_ssl = (uri.scheme == "https")

          return http
        end

    end

  end
end
