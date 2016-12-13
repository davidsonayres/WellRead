class ChatsController < ApplicationController

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
      @chat = Chat.find(params[:id])
      @chats = Chats.all(@conversation)
  end

  def edit
    @chat = Chat.find(params[:id])

    if @chat.update_attributes(chat_params)
      # insert flash alert that changes have been saved
      redirect_to :back
    else
      redirect_to :back
    end
  end

private

  def chat_params
    params.require(:chat).permit(:conversation_id, :content, :chats)
  end

end
