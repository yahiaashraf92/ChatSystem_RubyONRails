class ChatsController < ApplicationController
  before_action :set_application
  before_action :find_application
  before_action :find_chat, only: [ :update, :show ]

  def index
    render json: Chat.all
  end

  # curl -X POST http://localhost:3000/applications/5bc9e5c06f638fb21272/chats  -H "Content-Type: application/json"
  def create
    @chat = Chat.new

    @chat.application = @application

    if @chat.save
      render json: { chat_number: @chat.number }, status: :created
    else
      render json: { error: @chat.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /applications/:application_token/chats/:number
  def update
    if @chat.update(chat_params)
      render json: { message: "Chat updated successfully" }
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # GET /applications/:application_token/chats/:number
  def show
    render json: @chat
  end

  private

  def find_application
    @application = Application.find_by!(token: params[:application_token])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Application not found" }, status: :not_found
  end

  def find_chat
    @chat = @application.chats.find_by!(number: params[:number])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Chat not found" }, status: :not_found
  end

  def set_application
    @application = Application.find_by(token: params[:application_token])
    render json: { error: params[:application_token] }, status: :not_found unless @application
  end
end
