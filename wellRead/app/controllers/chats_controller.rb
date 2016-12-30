class ChatsController < ApplicationController
  before_action :find_chat, only: [:show, :edit, :update, :destroy]
  before_action :find_conversation, only: [:show, :edit, :update]

  def index
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.conversation = Conversation.find(params[:conversation_id])
    @chat.user = current_user

    if @chat.save
    # raise "hello"
      redirect_to book_conversation_path(@chat.conversation.book, @chat.conversation)
    else
        raise "goodbye"
      render :new
    end
  end

  def show
      @chats = Chats.all(@conversation)
  end

  def edit
  end

  def update
    if @chat.update(chat_params)
        # @chat.save!
      # insert flash alert that changes have been saved
      redirect_to book_conversation_chat_path(@book, @conversation, @chat.conversation)
    else
     render 'edit'
    end
  end

  def destroy
      @chat.destroy
      redirect_to book_conversation_path(@book, @conversation)
  end

private

  def chat_params
    params.require(:chat).permit(:conversation_id, :content, :chat_id)
  end
  def find_chat
    @chat = Chat.find(params[:id])
  end
  def find_conversation
      @conversation = Conversation.find(params[:id])
  end
end
