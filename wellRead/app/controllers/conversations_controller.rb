class ConversationsController < ApplicationController
    before_action :find_conversation, only: [:show, :edit, :update]
    # before_action :find_chat, only: [:show, :edit, :update, :destroy]
    before_action :find_user


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

    # need to find a way to say conversation id the chat belongs to
  end

  def edit
  end

  def update
    if @conversation.update(conversation_params)
      # insert flash alert that changes have been saved
          redirect_to book_conversation_path(@conversation)
        else
         render 'edit'
        end
      end

  def destroy
    #   currently Users can't delete conversations as other people may have participated.
    #  however admin would be able to delete a conversation.
  end

private

  def conversation_params
    params.require(:conversation).permit(:book_id, :title, :chats)
  end
  def find_conversation
      @conversation = Conversation.find(params[:id])
  end
  # def find_chat
  #   @chat = Chat.find(params[:chat_id])
  # end
  def find_user
    @user = current_user
  end

end
