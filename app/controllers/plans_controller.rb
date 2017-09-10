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
