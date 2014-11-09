require "seatgeek/version"
require "faraday"
require "hashie"
require "pry"
require 'multi_json'
require "active_support/all"

module SeatGeek
  class Request
    BASE_URI = 'https://api.seatgeek.com/2'
    BASE_PATH = nil
    class << self

      def find(id)
        url = "#{BASE_URI}#{self::BASE_PATH}"
        make_request("#{url}/#{id}")
      end

      def all
        url = "#{BASE_URI}#{self::BASE_PATH}"
        response = get(url)
        if response.success?
          return Hashie::Mash.new(MultiJson.load(response.body)).send(get_class_name)
        end
      end

      def connection
        @connection ||= Faraday.new
      end

      def connection=(connection)
        @connection = connection
      end

      private

      def get_class_name
        self.to_s.demodulize.downcase
      end

      def make_request(url)
        response = get(url)

        if response.success?
          return Hashie::Mash.new(MultiJson.load(response.body))
        end
      end

      def get(path, params = {})
        connection.get(path, params)
      end
    end
  end
end
