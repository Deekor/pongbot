class User < ActiveRecord::Base

  def matchups
    Matchup.where("player_one_id = ? OR player_two_id = ?", self.id, self.id)
  end

  def specific_matchup(opponent_id)
    matchups.where("player_one_id = ? OR player_two_id = ?", opponent_id, opponent_id).first
  end
end
