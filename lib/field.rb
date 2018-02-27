class Field
  attr_reader :field

  def initialize
    @field = [
      %w(* * *),
      %w(* * *),
      %w(* * *),
    ]
  end

  def is_not_full?
    @field.flatten.include?('*')
  end

  def transpose
    @field.transpose
  end

  def diagn_1
    [].tap do |diag|
      (0..2).each { |i| diag << @field[i][i] }
    end
  end

  def diagn_2
    [].tap do |diag|
      j = 2
      (0..2).each do |i|
        diag << @field[i][j]
        j -= 1
      end
    end
  end

  def can_fill_position?(x:, y:)
    @field[x][y] == '*'
  end

  def fill_position(value, x:, y:)
    @field[x][y] = value
  end
end
