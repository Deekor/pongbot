class User < ActiveRecord::Base

  def matchups
    Matchup.where("player_one_id = ? OR player_two_id = ?", self.id, self.id)
  end

  def specific_matchup(id)
    matchups.where("player_one_id = ? OR player_two_id = ?", id, id).first
  end
end
