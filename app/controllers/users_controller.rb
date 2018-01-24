class UsersController < ApplicationController

#sign up
get '/signup' do
  if !session[:user_id]
    erb :'users/new'
  else
    redirect to '/workouts'
  end
end

post '/signup' do
 if params[:user_name] == "" || params[:password] == ""
    #redirect to '/signup'
   erb :'users/new'
  else
  #  @user = User.create(username: params[:username], password: params[:password])
    @user = User.create(params[:user])
    raise params.inspect
    session[:user_id] = @user.id
    redirect '/plans'
  end
  # params = {:user => {:username => test123, :password => 12345}}
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

#show
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

#logout
get '/logout' do
  if logged_in?
    session.clear
    redirect to '/login'
  else
    redirect '/'
  end
end


end
