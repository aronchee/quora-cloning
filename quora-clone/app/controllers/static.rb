enable :session

get '/' do
  	erb :"static/index"
end

# get '/user_id/:id/menu'

# This for the signup and login page:
post '/signup' do
	# byebug
	@user = User.new(params[:user])
	if @user.save
		@msg = "You have signed up"
		# when user enter valid character
	else
		@msg = "Fail to sign up"
		# when user enter invalid character
	end 
	erb :"static/index"
end

# post '/login' do
# 	@user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
# 	if	# user = User.find_by(email: params[:email])
# 		redirect'/'
# 	else
# 	end
# end

post '/login' do
	 @user = User.find_by(email: params[:email])
	 # byebug
	if @user.try(:authenticate, params[:password]) 
		login @user
		# byebug
		erb :"static/menu"
		# @msg1 = "You have logged in"
	else
		@msg1 = "Wrong email or password or try to Signup"
		erb :"static/index"
	end
end

# This is for user to log out:
post '/logout' do
	# logout
	session[:user_id] = nil
	erb :"static/index"
end

# This is for the user profile page:
post '/users/:id' do
	erb :"static/profile"
end

post '/back' do
	erb :"static/menu"
end