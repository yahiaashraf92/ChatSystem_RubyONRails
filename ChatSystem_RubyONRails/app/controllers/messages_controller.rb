class MessagesController < ApplicationController
  before_action :set_application_and_chat
  # before_action :find_application
  # before_action :find_chat
  # before_action :find_message

  # POST /applications/:token/chats/:chat_number/messages
  # curl -X POST http://localhost:3000/applications/5bc9e5c06f638fb21272/chats/1/messages  -H "Content-Type: application/json" --data '{"content": "Hello, world!"}'
  def create
    @message = Message.new(message_params)

    @message.chat = @chat

    if @message.save
      render json: { message_number: @message.number, content: @message.content }, status: :created
    else
      render json: { error: @chat.id  }, status: :unprocessable_entity
    end
  end

  # PUT /applications/:application_token/chats/:chat_number/messages/:number
  def update
    if @message.update(message_params)
      render json: { message: "Message updated successfully" }
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # GET /applications/:application_token/chats/:chat_number/messages/:number
  def show
    render json: @message
  end

  def find_application
    @application = Application.find_by!(token: params[:application_token])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Application not found" }, status: :not_found
  end

  def find_chat
    @chat = @application.chats.find_by!(number: params[:chat_number])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Chat not found" }, status: :not_found
  end

  private

  # Find application and chat by token and chat number
  def set_application_and_chat
    @application = Application.find_by(token: params[:application_token])
    return render json: { error: "Application not found" }, status: :not_found unless @application

    @chat = Chat.find_by(number: params[:chat_number], application_id: @application.id)
    render json: { error: "Chat not found" }, status: :not_found unless @chat
  end

  # Strong parameters for message
  def message_params
    params.require(:message).permit(:content)
  end
end
