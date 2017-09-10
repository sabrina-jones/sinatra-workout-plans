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



end
