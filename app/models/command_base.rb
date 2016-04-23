class CommandBase
  def initialize(params)
    @params = params
    split_text
  end

  def respond
    { text: "Respond method not implemented"}
  end

  private

  def split_text
    @text = @params[:text].strip.split(" ")
  end

  # Gets the user_id from the slack API
  def user_id(username)
    response = HTTParty.post("#{secrets.slack_api_base}/users.list", body: { token: secrets.slack_api_token })
    response["members"].each do |member|
      if member["name"] == username
        return member["id"]
      end
    end
  end

  def secrets
    Rails.application.secrets
  end
end