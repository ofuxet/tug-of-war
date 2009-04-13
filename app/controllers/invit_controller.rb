class InvitController < ApplicationController
	def index
	end

	def sendmail
		if (params[:invit][:name].empty? || params[:invit][:email].empty?)
			redirect_to :action => "index"
		else
			@name = params[:invit][:name]
			@to = params[:invit][:email]
			Notifier.deliver_email (@to, @name)
		end
	end
end
