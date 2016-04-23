class BotController < ApplicationController

  def respond
    render json: { text: "Hello World"}
  end
end