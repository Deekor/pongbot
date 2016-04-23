class BotController < ApplicationController
  before_filter :check_token

  def respond

    render json: CommandHandler.new(params).response
  end

  def check_token
    unless params[:token] == secrets.slack_token
      render text: 'bad token'
      return
    end
  end
end