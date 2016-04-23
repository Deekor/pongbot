class BotController < ApplicationController
  before_filter :check_token

  def respond
    CommandHandler.new(params)
    render json: { text: "Hello World" }
  end

  def check_token
    unless params[:token] == Rails.application.secrets.slack_token
      render text: 'bad token'
      return
    end
  end
end