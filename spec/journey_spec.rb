# describe Journey do
#   let(:start_station) { instance_double('Station', zone: 1) }
#   let(:end_station) { instance_double('Station', zone: 2) }

#   describe '#new' do 
#     it 'should start with a station'
#   end

#   describe '#travelled_from_zone' do
#     it 'should return zone of start station'
#   end

#   describe '#travelled_to_zone' do
#     it 'should return zone of end station'
#   end
# end

describe Journey do
	subject(:journey) { described_class.new }
	let(:end_station) { instance_double('Station', zone: 2) }
  let(:oystercard) { instance_double('Oystercard', balance: 30) }

	describe '#end_journey' do
		context 'when the customer touches_out' do
			before(:each) { oystercard.touch_out(end_station) }

			it 'should change journey_ended_at to end station' do
				expect { end_journey(Station.new) }.to change(journey, :travelled_from).to be_an_instance_of Station
			end
		end
	end
end 