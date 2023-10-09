class ApplicationController < ActionController::Base
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params.require(:message).permit(:message))
    @message.save!

    MessageChannel.broadcast_to('message_channel', @message)
    head :ok
  end
end
