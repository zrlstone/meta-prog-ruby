class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name)
    super if !@data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize} #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def respond_to_missing?(method, include_private = false)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end

class DS
  def get_mouse_info(workstation_id)
    "Logitech"
  end

  def get_mouse_price(workstation_id)
    40
  end

  def get_cpu_info(workstation_id)
    "2.16 Ghz"
  end

  def get_cpu_price(workstation_id)
    220
  end

  def get_keyboard_info(workstation_id)
    "Standard"
  end

  def get_keyboard_price(workstation_id)
    18
  end
end

ds = DS.new

computer = Computer.new(1, ds)
puts computer.mouse
puts computer.respond_to?(:mouse)
puts computer.respond_to?(:explode)
