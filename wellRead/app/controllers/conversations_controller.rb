class ConversationsController < ApplicationController

  def index
      @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
    @conversations = Conversation.all
    # @edition = Edition.find(params[:book_id])
    @book = Book.find(params[:book_id])
    @chat = Chat.new
  end

  def create
    # @edition = Edition.find(params[:book_id])
    @book = Book.find(params[:book_id])
    @conversation = Conversation.new(conversation_params)
    @conversation.user = current_user

    if @conversation.save!
       @conversation.chats << Chat.new(content: params[:conversation][:chat][:content], user: current_user)

        
      redirect_to book_conversation_path(@book, @conversation)
    else
      render :new
    end
  end

  def show
    @conversations = Conversation.all
    @conversation = Conversation.find(params[:id])

    # need to find a way to say conversation id the chat belongs to
  end

  def edit
    @conversation = Conversation.find(params[:id])

    if @conversation.update_attributes(conversation_params)
      # insert flash alert that changes have been saved
      redirect_to :back
    else
      redirect_to :back
    end
  end

private

  def conversation_params
    params.require(:conversation).permit(:book_id, :title, :chats)
  end

end
