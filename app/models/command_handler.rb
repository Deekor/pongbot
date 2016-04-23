class CommandHandler
  def initialize(params)
    @params = params
    store_issuer
  end

  # The response to the command given
  def response
    begin
      action.classify.constantize.new(@params).respond
    rescue
      { text: ":warning: Whoops! Looks like something went wrong. Did you type the command right?", response_type: "ephemeral" }
    end
  end

  private

  def action
    @params[:text].strip.split(" ").first
  end

  # Stores the command issuer into the database
  def store_issuer
    user = User.find_or_create_by(slack_id: @params[:user_id])
    user.update(username: @params[:user_name]) # in case they have changed their username
  end
end