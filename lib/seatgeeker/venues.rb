require 'seatgeeker/request'

module SeatGeeker
  class Venues < SeatGeeker::Request
    BASE_PATH = "/venues"

    class << self
      def city(city_name)
        find(city: city_name.parameterize)
      end

      def state(state_name)
        if state_name.length > 2
          state_name = state_hash[state_name]
        end
        find(state: state_name)
      end

      def postal_code(zip_code)
        find(postal_code: zip_code)
      end

      def state_hash
        {
         "Alabama"=>"AL",
         "Alaska"=>"AK",
         "Arizona"=>"AZ",
         "Arkansas"=>"AR",
         "California"=>"CA",
         "Colorado"=>"CO",
         "Connecticut"=>"CT",
         "Delaware"=>"DE",
         "Florida"=>"FL",
         "Georgia"=>"GA",
         "Hawaii"=>"HI",
         "Idaho"=>"ID",
         "Illinois"=>"IL",
         "Indiana"=>"IN",
         "Iowa"=>"IA",
         "Kansas"=>"KS",
         "Kentucky"=>"KY",
         "Louisiana"=>"LA",
         "Maine"=>"ME",
         "Maryland"=>"MD",
         "Massachusetts"=>"MA",
         "Michigan"=>"MI",
         "Minnesota"=>"MN",
         "Mississippi"=>"MS",
         "Missouri"=>"MO",
         "Montana"=>"MT",
         "Nebraska"=>"NE",
         "Nevada"=>"NV",
         "New Hampshire"=>"NH",
         "New Jersey"=>"NJ",
         "New Mexico"=>"NM",
         "New York"=>"NY",
         "North Carolina"=>"NC",
         "North Dakota"=>"ND",
         "Ohio"=>"OH",
         "Oklahoma"=>"OK",
         "Oregon"=>"OR",
         "Pennsylvania"=>"PA",
         "Rhode Island"=>"RI",
         "South Carolina"=>"SC",
         "South Dakota"=>"SD",
         "Tennessee"=>"TN",
         "Texas"=>"TX",
         "Utah"=>"UT",
         "Vermont"=>"VT",
         "Virginia"=>"VA",
         "Washington"=>"WA",
         "West Virginia"=>"WV",
         "Wisconsin"=>"WI",
         "Wyoming"=>"WY"
        }
      end
    end
  end
end
