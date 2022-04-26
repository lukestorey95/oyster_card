class Oystercard
  DEFAULT_VALUE = 0
  MAX_BALANCE = 90
  MIN_CHARGE = 1

  attr_reader :balance

  def initialize
    @balance = DEFAULT_VALUE
    @in_use = false
  end

  def top_up(amount)
    fail "Maximum balance #{MAX_BALANCE} exceeded" if exceeds_max?(amount)
    @balance += amount
  end

  def check_balance
    balance
  end

  def in_journey?
    in_use
  end

  def touch_in
    fail "Insufficient funds - balance below #{MIN_CHARGE}" if insufficient_balance?
    @in_use = true
  end

  def touch_out(fare)
    deduct(fare)
    @in_use = false
  end

  private

  attr_reader :in_use

  def exceeds_max?(amount)
    balance + amount > MAX_BALANCE
  end

  def insufficient_balance?
    check_balance < MIN_CHARGE
  end

  def deduct(fare)
    @balance -= fare
  end

end