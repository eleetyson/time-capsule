class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new
    @message.content = params[:message][:content]
    @message.email_address = params[:message][:email_address]
    binding.pry
    if @message.save
      min = params[:message][:delivery_time].to_i
      UserMailer.scheduled_email(@message).deliver_later(wait: min.minutes.from_now)
      flash[:notice] = "Your message was scheduled :)"
    else
      flash[:notice] = "Unable to schedule message :("
    end

    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:content, :email_address, :delivery_time)
  end
end
