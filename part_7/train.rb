require_relative "./manufacturer.rb"
require_relative "./instance_counter.rb"
require_relative "./valid.rb"

class Train
  include Manufacturer
  include InstanceCounter
  include Valid

  NUMBER_FORMAT = /^[a-zа-яё\d]{3}-?[a-zа-яё\d]{2}$/i #Допустимый формат: три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса.
  #TYPE_FORMAT = /(cargo|passenger)/i
  EMPTY_NUMBER_ERROR = "Номер не может быть пустым!" 
  NUMBER_FORMAT_ERROR = "Формат номера не соответствует! (3 буквы или цифры, опционально дефис, 2 буквы или цифры)"

  attr_reader :speed, :carriages, :route, :number, :type, :current_station, :stations

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type) #type = cargo || passenger
    @number = number
    @type = type
    @carriages = []
    @speed = 0
    @@trains[number] = self
    register_instance
    validate!
  end

  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    return unless speed.zero? 
    @carriages << carriage if attachable_carriage?(carriage)
  end

  def remove_carriage
    return unless speed.zero?
    @carriages.pop
  end

  def set_route(route)
    @route = route
    @current_station = 0
    current_station.add_train(self) #на станцию начальную[0] добавляем текущий объект
  end

  def forward
    return unless next_station
    current_station.send_train(self)
    next_station.add_train(self)
    @current_station += 1
  end

  def back
    return unless prev_station
    current_station.send_train(self)
    prev_station.add_train(self)
    @current_station -= 1
  end

  def current_station
    route.stations[@current_station] #возвращает станцию на позиции @current_station
  end

  protected

  def validate!
    raise EMPTY_NUMBER_ERROR if number.nil?
    raise NUMBER_FORMAT_ERROR if number !~ NUMBER_FORMAT
    #raise "Не верный тип! Укажите cargo для грузового или passenger для пассажирского." if type !~ TYPE_FORMAT
  end

  def prev_station
    route.stations[@current_station - 1] if @current_station.positive? #возвращает станцию на позиции @current_station - 1
  end  

  def next_station
    route.stations[@current_station + 1] #возвращает станцию на позиции @current_station + 1
  end 
end
