describe SeatGeek::Venues do
  it "should search for a venue by city" do
    VCR.use_cassette('venues_city', record: :all) do
      expect(SeatGeek::Venues.city("New York").first.city).to eq "New York"
    end
  end

  it "should search for a venue by full state name" do
    VCR.use_cassette('venues_state', record: :all) do
      expect(SeatGeek::Venues.state("New York").first.state).to eq "NY"
    end
  end

  it "should search for a venue by state abbreviation" do
    VCR.use_cassette('venues_state', record: :all) do
      expect(SeatGeek::Venues.state("NY").first.state).to eq "NY"
    end
  end

  it "should search for a venue by postal_code" do
    VCR.use_cassette('venues_postal_code', record: :once) do
      # SeatGeek returns a list around a radius. Difficult to test.
      expect(SeatGeek::Venues.postal_code(10001).fourth.postal_code).to eq 10001.to_s
    end
  end
end
