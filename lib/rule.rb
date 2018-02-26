class Rule
  PLAYERS = [Game::PLAYER_1, Game::PLAYER_2]

  def can_continue?(field)
    return false if winner?(field)

    field.is_not_full?
  end

  def winner(field)
    PLAYERS.each do |player|
      return player if is_player_winner?(field, player)
    end

    'nobody are winners'
  end

  private

  def winner?(field)
    PLAYERS.any? { |player| is_player_winner?(field, player) }
  end

  def is_player_winner?(field, player)
    field.field.each do |row|
      return true if player_fill_all_row?(row, player)
    end

    field.transpose.each do |row|
      return true if player_fill_all_row?(row, player)
    end

    return true if player_fill_all_row?(field.diagn_1, player)
    return true if player_fill_all_row?(field.diagn_2, player)
  end

  def player_fill_all_row?(row, player)
    row.all? { |cell| cell == player }
  end
end
