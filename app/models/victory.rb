class Victory < CommandBase

  def respond
    get_users
    matchup = @winner.specific_matchup(@loser.id)
    unless matchup
      matchup = Matchup.create(player_one_id: @winner.id, player_two_id: @loser.id)
    end
    matchup.victory_for(@winner.id)
    { response_type: "in_channel", text: ":trumpet: *Trumpets Playing* :trumpet: \n Hear ye! Hear ye! I would like to announce the victory of <@#{@winner.slack_id}> over <@#{@loser.slack_id}> \n #{matchup.series_status}"}
  end

  def get_users
    winner_id = user_id(@text[1].delete("@"))
    loser_id = user_id(@text[2].delete("@"))

    if winner_id && loser_id && winner_id != loser_id
      @winner = User.find_or_create_by(slack_id: winner_id)
      @winner.update(username: @text[1].delete("@"))

      @loser = User.find_or_create_by(slack_id: loser_id)
      @loser.update(username: @text[2].delete("@"))
    end

  end

end