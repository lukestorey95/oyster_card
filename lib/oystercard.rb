class Oystercard
  STARTING_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :in_journey, :current_journey, :journey_history

  def initialize
    @balance = STARTING_BALANCE
    @in_journey = false
    @current_journey = nil
    @journey_history = []
  end

  def top_up(amount)
    fail "Maximum balance #{MAX_BALANCE} exceeded" if exceeds_max?(amount)
    self.balance += amount
  end

  def touch_in(start_station)
    fail "Insufficient funds - balance below #{MIN_FARE}" if insufficient_balance?
    self.in_journey = true
    self.current_journey = Journey.new(start_station)
  end

  def touch_out(end_station)
    current_journey.end_journey(end_station)
    charge_correct_fare
    self.in_journey = false
    self.journey_history << current_journey
    self.current_journey = nil
  end

  private

  attr_writer :balance, :in_journey, :current_journey, :journey_history

  def exceeds_max?(amount)
    balance + amount > MAX_BALANCE
  end

  def insufficient_balance?
    balance < MIN_FARE
  end

  def charge_correct_fare
    self.balance -= current_journey.fare
  end
end
