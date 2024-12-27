class Socket
  def plug_in
    raise NotImplementedError, 'Метод должен быть переопределен'
  end
end



class USA_Socket < Socket
  def plug_in
    "Подключено к розетке типа (США)"
  end
end

class EU_Socket < Socket
  def plug_in
    "Подключено к розетке типа (Европа)"
  end
end

class Russian_Socket < Socket
  def plug_in
    "Подключено к розетке типа (Россия)"
  end
end


class Adapter
  def initialize(socket)
    @socket = socket
  end

  def plug_in
    @socket.plug_in
  end
end



us_socket = USA_Socket.new
eu_socket = EU_Socket.new
ru_socket = Russian_Socket.new

socket1 = Adapter.new(us_socket)
socket2 = Adapter.new(eu_socket)
socket3 = Adapter.new(ru_socket)


puts socket1.plug_in
puts socket2.plug_in
puts socket3.plug_in