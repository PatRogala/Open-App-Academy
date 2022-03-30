require_relative 'room'

class Hotel
  attr_reader :rooms

  def initialize(name, rooms)
    @name = name
    @rooms = rooms.transform_values { |capacity| Room.new(capacity) }
  end

  def name
    @name.split(' ').map(&:capitalize).join(' ')
  end

  def room_exists?(name)
    rooms.keys.include?(name)
  end

  def check_in(person, room_name)
    return puts 'sorry, room does not exist' unless room_exists?(room_name)
    return puts 'sorry, room is full' unless rooms[room_name].add_occupant(person)

    puts 'check in successful'
  end

  def has_vacancy?
    rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    rooms.each { |room_name, room| puts "#{room_name} #{room.available_space}" }
  end
end
