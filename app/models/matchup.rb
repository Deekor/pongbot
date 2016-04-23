class Matchup < ActiveRecord::Base

  def victory_for(id)
    if self.player_one_id == id
      self.player_one_score += 1
      self.save
    else
      self.player_two_score += 1
      self.save
    end
  end

  def series_status
    tie = false
    if player_one_score > player_two_score
      leader = [player_one_id, player_one_score, player_two_score]
    elsif player_one_score < player_two_score
      leader = [player_two_id, player_two_score, player_one_score]
    else
      tie = true
    end

    if tie
      "The series score is now tied up at #{player_one_score} each."
    else
      "<@#{User.find(leader[0]).slack_id}> now leads by a score of #{leader[1]} to #{leader[2]}"
    end

  end
end
