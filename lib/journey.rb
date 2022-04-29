class Journey
  attr_accessor :travelled_to
  attr_reader :travelled_from, :fare

  def initialize(start_station)
    @travelled_from = start_station
    @travelled_to = nil
    @fare = DEFAULT_FARE
  end

  def end_journey(end_station)
    self.travelled_from = end_station
    calculate_correct_fare
  end

  private

  attr_writer :travelled_from, :fare

  def calculate_correct_fare
    self.fare = (travelled_from.zone - travelled_to.zone).abs
  end
end
