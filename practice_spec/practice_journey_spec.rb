describe Journey do
  let(:start_station) { instance_double('Station', zone: 1) }
  let(:end_station) { instance_double('Station', zone: 2) }

  describe '#new' do 
    it 'should start with a station'
  end

  describe '#travelled_from_zone' do
    it 'should return zone of start station'
  end

  describe '#travelled_to_zone' do
    it 'should return zone of end station'
  end
end