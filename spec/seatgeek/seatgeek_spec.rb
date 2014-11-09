describe SeatGeek::Request do
  context "defaults" do
    it "should set the proper base uri" do
      expect(SeatGeek::Request::BASE_URI).to eq "https://api.seatgeek.com/2"
    end
  end

  context "events" do
    it "should retrieve a specific events" do
      VCR.use_cassette('events', record: :once) do
        expect(SeatGeek::Events.find("2101779").title).to eq "San Francisco 49ers at New York Giants"
      end
    end

    it "should retrieve all events" do
      VCR.use_cassette('events_all', record: :once) do
        result = SeatGeek::Events.all
        expect(result).to be_a Array
        expect(result.first.title).to eq "Cash"
      end
    end
  end

  context "venues" do
    it "should retrieve a specific venue" do
      VCR.use_cassette('venues', record: :all) do
        expect(SeatGeek::Venues.find("2513").name).to eq "The Theater at Madison Square Garden"
      end
    end
  end
end
