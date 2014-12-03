class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy]

  def index
    @messages =  @c_user.messages.order("created_at desc")
  end

  def show
    @s = User.find(@message.sender_id)
    if @message.user_id != session[:user_id]
      render :forbidden
    else
      Message.find(@message.id).update(:read => true)
      render :show
    end

  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)

    respond_to do |format|
      if @message.save

        if params[:files]

          params[:files].each { |f|
            @message.file_attaches.create(file: f)
          }
        end

        @u = User.find(@message.user_id)
        format.html { redirect_to user_url(@u), notice: 'Message sent.' }
      else
        format.html { render :new }
      end
    end
  end


  def destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:subject, :message, :read, :user_id, :sender_id)
  end
end