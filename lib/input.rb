class Input
  POSITIONS = {
    '0' => {x: 0, y: 0},
    '1' => {x: 0, y: 1},
    '2' => {x: 0, y: 2},
    '3' => {x: 1, y: 0},
    '4' => {x: 1, y: 1},
    '5' => {x: 1, y: 2},
    '6' => {x: 2, y: 0},
    '7' => {x: 2, y: 1},
    '8' => {x: 2, y: 2}
  }

  def initialize(value)
    @value = value
  end

  def valid?
    POSITIONS.keys.include?(@value)
  rescue => e
    puts "Somenthing went wrong #{e}"
    false
  end

  def positions
    POSITIONS[@value]
  end
end
