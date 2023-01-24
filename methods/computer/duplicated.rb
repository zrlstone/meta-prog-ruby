class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method(name) do
      info = @data_source.send("get_#{name}_info", @id)
      price = @data_source.send("get_#{name}_price", @id)
      result = "#{name.capitalize} #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
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
p ds.get_cpu_info(1)
computer = Computer.new(1, ds)
p computer.cpu
p computer.send(:method_missing, :explode)