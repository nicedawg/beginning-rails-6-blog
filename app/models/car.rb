class Car
  attr_accessor :make, :model, :year, :color

  def paint(new_color)
    self.color = new_color
  end
end
