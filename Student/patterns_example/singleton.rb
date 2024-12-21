class Singleton
  @instance = nil

  def self.instance
    @instance ||= new
  end

  private_class_method :new

end

singleton1 = Singleton.instance

singleton2 = Singleton.instance
puts singleton1.object_id == singleton2.object_id