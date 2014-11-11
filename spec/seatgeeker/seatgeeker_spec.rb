describe SeatGeeker::Request do
  context "defaults" do
    it "should set the proper base uri" do
      expect(SeatGeeker::Request::BASE_URI).to eq "https://api.seatgeek.com/2"
    end
  end

  context "events" do
    it "should retrieve a specific events" do
      VCR.use_cassette('events', record: :all) do
        expect(SeatGeeker::Events.find(id: 2101779).title).to eq "San Francisco 49ers at New York Giants"
      end
    end

    it "should retrieve all events" do
      VCR.use_cassette('events_all', record: :once) do
        result = SeatGeeker::Events.all
        expect(result).to be_a Array
        expect(result.first.title).to eq "Angel Olsen"
      end
    end

    it "should search for an event" do
      VCR.use_cassette('events_search', record: :once) do
        expect(SeatGeeker::Events.search("New York Giants").first.title).to eq "San Francisco 49ers at New York Giants"
      end
    end
  end

  context "venues" do
    it "should retrieve a specific venue" do
      VCR.use_cassette('venues', record: :all) do
        expect(SeatGeeker::Venues.find(id: 93).name).to eq "Madison Square Garden"
      end
    end

    it "should search for venues" do
      VCR.use_cassette('venues_search', record: :all) do
        expect(SeatGeeker::Venues.search("Madison Square Garden").first.name).to eq "Madison Square Garden"
      end
    end
  end
end
