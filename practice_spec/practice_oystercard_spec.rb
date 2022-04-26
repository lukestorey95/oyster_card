describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:journey) { double('Journey', travelled_from_zone: 1, travelled_to_zone: 2) }
  let(:start_station) { double('Station', zone: 1) }
  let(:end_station) { double('Station', zone: 2) }

  max_amount = Oystercard::MAX_BALANCE
  min_fare = Oystercard::MIN_FARE
  # penalty_charge = Oystercard::PENALTY_CHARGE

  describe 'balance' do
    subject(:balance) { oystercard.balance }

    describe '#add' do
      context 'when balance is not at max' do
        it 'should change balance by amount added'
      end

      context 'when balance is at max' do
        it 'should not allow amount to be added to balance'
      end
    end

    describe '#deduct' do
      it 'should change balance by fare amount'

      it 'should change balance by correct fare'

      context 'when card has not been tapped in or out' do
        it 'should change balance by penalty charge amount'
      end
    end
  end
  
  describe 'in_journey' do
    subject(:in_journey) { oystercard.in_journey }

    describe '#touch_in' do
      it 'should start a journey'

      it 'should change state to be in_journey'

      context 'when balance is below minimum fare' do
        it 'should not allow card to tap in'
      end
    end

    describe '#touch_out' do
      it 'should end a journey'

      it 'should change state to not be in_journey'
    end
  end

  describe '#see_journey_history' do
    it 'should return history of journeys'
  end
end
