require 'pry'
class PlansController < ApplicationController

# lists index
  get '/plans' do
    @plans = Plan.all
    erb :'plans/index'
  end

#create new plan
get '/plans/create_plan' do
  erb :'plans/create_plan'
end

post '/plans' do
#  binding.pry
  if params[:name] == ''
    redirect to 'plans/create_plan'
  else
    user = User.find_by_id(session[:user_id])
    @plan = Plan.create(name: params[:name], user_id: user.id)
    redirect to "/plans/#{@plan.id}"
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

end
