class HomeController < ApplicationController
  def index
  end

  def get_current_user
    respond_to do |format|
      format.json do
        render json: current_user.as_json
      end
    end
  end

  def messages
    respond_to do |format|
      format.json do
        render json: Message.all.as_json(include: :user)
      end
    end
  end

  def create_message
    respond_to do |format|
      format.json do
        message = Message.create(user: current_user, message: params[:message])
        return unless message

        ActionCable.server.broadcast("chatroom", message: message.as_json, user: message.user.as_json)
      end
    end
  end
end
