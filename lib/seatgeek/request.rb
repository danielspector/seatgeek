module SeatGeek
  class Request
    BASE_URI = 'https://api.seatgeek.com/2'

    class << self

      def find(opts = nil)
        params = build_params(opts)
        make_request(url, params)
      end

      def search(search_query)
        search_query = search_query.parameterize
        params = build_params({q: search_query})
        make_request(url, params)
      end

      def all
        response = get(url)
        if response.success?
          return Hashie::Mash.new(MultiJson.load(response.body)).send(get_class_name)
        end
      end

      def connection
        @connection ||= Faraday.new
      end

      private

      def build_params(opts)
        return {}.tap do |hash|
            opts.each do |key, value|
            hash[key] = value
          end
        end
      end

      def get_class_name
        self.to_s.demodulize.downcase
      end

      def make_request(url, params)
        response = get(url, params)

        if response.success?
          result = generate_parsed_response(response)
          return get_first_element_if_exists(result)
        end
      end

      def generate_parsed_response(response)
        return Hashie::Mash.new(MultiJson.load(response.body)).send(get_class_name)
      end

      def url
        "#{BASE_URI}#{self::BASE_PATH}"
      end

      def get_first_element_if_exists(result)
        if result.count == 1
          return result.first
        else
          return result
        end
      end

      def get(path, params = {})
        connection.get(path, params)
      end
    end
  end
end
