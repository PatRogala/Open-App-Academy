class Flight
  attr_reader :passengers

  def initialize(flight_number, capacity)
    @flight_number = flight_number
    @capacity = capacity
    @passengers = []
  end

  def board_passenger(passenger)
    return if full?

    @passengers << passenger if passenger.has_flight?(@flight_number)
  end

  def list_passengers
    @passengers.map(&:name)
  end

  def [](index)
    @passengers[index]
  end

  def <<(passenger)
    board_passenger(passenger)
  end

  def full?
    @passengers.size == @capacity
  end
end
