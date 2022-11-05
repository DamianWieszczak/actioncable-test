class MessagesController < ApplicationController

  def index
    @message = current_user.messages.build(message_params)
    @message.save
    ActionCable.server.broadcast('message', @message.as_json(inlucde: :user))
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
  
end
