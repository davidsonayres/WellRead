class ChatsController < ApplicationController

  def index
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      redirect_to root_url
    else
      render :new
  end

  def show
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
    params.require(:user).permit()
  end

end
