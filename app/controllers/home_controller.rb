class HomeController < ApplicationController
  def index
		@users = User.all
		@user = User.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  	def signup_form
  		@user = User.new
  		respond_to do |format|
			format.html # signup_form.html.erb
			format.xml  { render :xml => @user }
		end
	end


	def loggin
		@user = User.find(:first, :conditions => ["name = :name AND password = :password", { :name => params[:user][:name], :password => params[:user][:password] }])
		if @user
			session[:logged] = true
			session[:user_id] = @user.id
			redirect_to :action => "me"
		else
			session[:logged] = false
			session[:user_id] = -1;
			redirect_to :action => "me"
		end
	end
	
	
	def unlog
		session[:logged] = false
		session[:user_id] = -1;
		redirect_to :action => "index"
	end


	def signup
		@user = User.new
		@user.name = params[:user][:name]
		@user.password = params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]
		@user.email = params[:user][:email]
		@user.money = 1000
		if @user.save
	      flash[:notice] = 'User was successfully created.'
	      redirect_to :action => "confirm_signup"
	    end
	end
	
	def confirm_signup
		respond_to do |format|
			format.html # confirm_signup.html.erb
			format.xml  { render :xml => @user }
		end
	end


	def me
		if !session[:logged]
			redirect_to :action => :index
		elsif User.exists?(session[:user_id])
			@user = User.find(session[:user_id])
			@games = Game.find(:all,
							:conditions => [ "g.id = p.game_id AND p.user_id = :user_id", { :user_id => session[:user_id] }],
							:from => 'games AS g, players AS p',
							:select => 'g.*, p.boss_id AS my_boss');
		else
			redirect_to :action => "index"
		end
	end

	def editme
		if !session[:logged] then redirect_to :action => :index end
		@user = User.find(session[:user_id])
	end

	def update_me
		if !session[:logged] then redirect_to :action => :index end
		@user = User.find(session[:user_id])
		if @user.update_attributes(params[:user])
    	flash[:notice] = 'User was successfully updated.'
			redirect_to :action => "me"
		else
			render :action => "editme"
		end
	end

end
