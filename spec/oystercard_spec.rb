describe Oystercard do
  max_balance = Oystercard::MAX_BALANCE
  min_fare = Oystercard::MIN_FARE
  fare = min_fare
  
  describe '#balance' do
    it 'should have default value of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  
  describe '#top_up' do
    it 'should increase the balance by the amount' do
      amount = 20
      expect{ subject.top_up(amount) }.to change{ subject.balance }.by(amount)
    end

    it 'should not allow the balance to go above the maximum allowed' do
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error("Maximum balance #{max_balance} exceeded")
    end
  end

  context 'card balance is topped up' do
    before(:each) { subject.top_up(max_balance) }
    
    describe '#touch_in' do
      it 'should change card status to be in use' do
        subject.touch_in
        expect(subject).to be_in_journey
      end

      it 'should not let the user touch in with a balance below the minimum' do
        empty_card = Oystercard.new
        expect{ empty_card.touch_in }.to raise_error "Insufficient funds - balance below #{min_fare}"
      end

    end

    describe '#touch_out' do
      it 'should change card status to not be in use' do
        subject.touch_in
        subject.touch_out(fare)
        expect(subject).to_not be_in_journey
      end

      it 'should deduct the fare from the balance' do 
        expect{ subject.touch_out(fare) }.to change { subject.balance }.by(-fare) 
      end
    end
  end
end
