class ChatsController < ApplicationController
  before_action :find_chat, only: [:show, :edit, :update, :destroy]
  before_action :find_conversation, only: [:show, :edit, :update]
  before_action :find_book, only: [:show, :edit, :update]

  # before_action :emojify, only: [:index, :new, :create, :edit, :update]

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
      @chats = Chat.where(conversation_id: @conversation)
  end

  def edit
  end

  def update
    if @chat.update(chat_params)
        # @chat.save!
      # insert flash alert that changes have been saved
      redirect_to book_conversation_path(@book, @conversation)
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
      @conversation = Conversation.find(params[:conversation_id])
  end
  def find_book
      @book = Book.find(params[:book_id])
  end
  # def emojify(content)
  #     h(content).to_str.gsub(/:([\w+-]+):/) do |match|
  #         if emoji = Emoji.find_by_alias($1)
  #             %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
  #         else
  #             match
  #         end
  #     end.html_safe if content.present?
  # end
end
