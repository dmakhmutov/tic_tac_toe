class Game
  PLAYER_1 = 'X'
  PLAYER_2 = 'O'
  STEP_ORDER = %w(X O X O X O X O X)

  def initialize
    @field = Field.new
    @rule = Rule.new
  end

  def play
    STEP_ORDER.each do |step_sign|
      break unless can_continue?
      display_field
      do_step(step_sign)
    end

    puts '------------------------------------------------------------------'
    puts "Today winner is: #{winner}"
    puts '------------------------------------------------------------------'
    display_field
  end

  private

  def can_continue?
    @rule.can_continue?(@field)
  end

  def display_field
    @field.field.each { |x| puts x.join(' ') }
  end

  def do_step(step_sign)
    input = Input.new(gets.chomp)

    if input.valid? && @field.can_fill_position?(step_sign, input.positions)
      @field.fill_position(step_sign, input.positions)
    else
      puts 'Invalid number, please try again'
      do_step(step_sign)
    end
  end

  def winner
    @rule.winner(@field)
  end
end
