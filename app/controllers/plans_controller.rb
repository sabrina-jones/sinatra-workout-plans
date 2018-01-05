require 'pry'
class PlansController < ApplicationController

#  index
  get '/plans' do
    @plans = Plan.all
    erb :'plans/index'
    #erb :'users/show'
  end

#create new plan
get '/plans/new' do
  erb :'plans/new'
end

post '/plans' do
#  binding.pry
  if params[:name] == ''
    redirect to 'plans/new'
  else
    user = User.find_by_id(session[:user_id])
    @plan = Plan.create(name: params[:name], user_id: user.id)
    #redirect to "/plans/#{@plan.id}"
    redirect to "/plans"
  end
end

#show plan
get '/plans/:id' do
  #binding.pry
  if logged_in?
    @plan = Plan.find_by_id(params[:id])
    erb :'plans/show'
  else
    redirect to '/login'
  end
end

#edit plan
get '/plans/:id/edit' do
  #binding.pry
  if logged_in?
   @plan = Plan.find_by_id(params[:id])
    if @plan.user_id == session[:user_id]
       erb :'plans/edit'
    else
      redirect to '/plans'
    end
  else
    redirect to '/login'
  end
end

patch '/plans/:id' do
  #binding.pry
  if params[:name].empty?
     redirect to '/plans/#{params[:id]}/edit'
  else
    @plan = Plan.find_by_id(params[:id])
    @plan.name = params[:name]
    @plan.save
    #redirect to "/plans/#{@plan.id}"
    #redirect to "/plans"
     erb :'users/show'
  end
end

#delete plans
get '/plans/:id' do
  @plan = Plan.find_by_id(params[:id])
  erb :'plans/edit'
end

delete '/plans/:id' do
  @plan = Plan.find_by_id(params[:id])
  @plan.destroy
  redirect '/plans'
end

end
