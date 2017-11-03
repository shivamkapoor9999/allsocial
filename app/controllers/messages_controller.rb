class MessagesController < ApplicationController
  def create
  	
  	if(params[:receiver] == 'all')
  		User.all.each do |u|
  			if(u!=current_user)
  			m = Message.new
  			m.content = params[:content]
  			m.user = User.find_by(email:params[:sender])
  			m.receiver = u
  			m.save
  			end
  		end
  else
  	m = Message.new
    m.content = params[:content]
    m.user = User.find_by(email:params[:sender])
    res = User.find_by(email:params[:receiver])
    m.receiver = res
    m.save
  end
  end

  def message_params
		params.require(:message).permit(:message)
	end
end
