class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      if @message.delivery_time > DateTime.now
        UserMailer.scheduled_email(@message).deliver_later(wait_until: @message.delivery_time)
        flash[:notice] = "Your message was scheduled :)"
      else
        flash[:notice] = "invalid delivery time, can't schedule :("
      end
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
