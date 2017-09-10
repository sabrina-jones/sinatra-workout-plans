class UsersController < ApplicationController

#sign up
get '/signup' do
  if !session[:user_id]
    erb :'users/create_acct'
  else
    redirect to '/workouts'
  end
end

post '/signup' do
  if params[:user_name] == "" || params[:password] == ""
    redirect to '/signup'
  else
    @user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = @user.id
    redirect '/plans'
  end
end

#login
get '/login' do
  if !session[:user_id]
    erb :'users/login'
  else
    redirect '/plans'
  end
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/plans'
  else
    redirect '/signup'
  end
end


end
