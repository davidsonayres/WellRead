class ConversationsController < ApplicationController

  def index
  end

  def new
    @conversations = Conversation.new
  end

  def create
    @conversation = Conversation.new(my_book_params)

    if @conversation.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
  end

  def edit
    @conversation = Conversation.find(params[:id])

    if @conversation.update_attributes(my_book_params)
      # insert flash alert that changes have been saved
      redirect_to :back
    else
      redirect_to :back
    end
  end

private

  def conversation_params
    params.require(:user).permit()
  end

end
